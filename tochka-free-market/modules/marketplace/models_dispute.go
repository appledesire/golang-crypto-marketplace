package marketplace

import (
	"errors"
	"fmt"
	"time"

	"github.com/jinzhu/gorm"
	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/util"
)

type Dispute struct {
	Uuid string `json:"uuid" gorm:"primary_key"`

	Status string `json:"status" sql:"index"`

	ResolverUserUuid string `json:"resolver_user_uuid" sql:"index"`
	ResolverUser     User   `json:"-"`

	DisputeClaims []DisputeClaim `json:"dispute_claims"`

	// ORM timestamps
	CreatedAt *time.Time `json:"created_at"`
	UpdatedAt *time.Time `json:"updated_at"`
	DeletedAt *time.Time `json:"deleted_at"`
}

type DisputeClaim struct {
	gorm.Model

	Claim  string `json:"claim"`
	Status string `json:"status" sql:"index"`

	DisputeUuid string  `json:"dispute_uuid" sql:"index"`
	Dispute     Dispute `json:"-"`
}

/*
	Model Interface Implementation
*/

func (r Dispute) Validate() error {

	if r.Uuid == "" {
		return errors.New("Dispute UUID must be present")
	}

	return nil
}

func (i Dispute) Remove() error {
	return database.Delete(&i).Error
}

func (itm Dispute) Save() error {
	err := itm.Validate()
	if err != nil {
		return err
	}
	return itm.SaveToDatabase()
}

func (itm Dispute) SaveToDatabase() error {
	if existing, _ := FindDisputeByID(itm.Uuid); existing == nil {
		return database.Create(&itm).Error
	}
	return database.Save(&itm).Error
}

func (r DisputeClaim) Validate() error {

	if r.DisputeUuid == "" {
		return errors.New("DisputeID must be present")
	}
	if r.Claim == "" {
		return errors.New("Claim must be present")
	}

	return nil
}

func (i DisputeClaim) Remove() error {
	return database.Delete(&i).Error
}

func (itm DisputeClaim) Save() error {
	err := itm.Validate()
	if err != nil {
		return err
	}
	return itm.SaveToDatabase()
}

func (itm DisputeClaim) SaveToDatabase() error {
	if existing, _ := FindDisputeClaimByID(itm.ID); existing == nil {
		return database.Create(&itm).Error
	}
	return database.Save(&itm).Error
}

func (d Dispute) Transaction() (*Transaction, error) {
	return FindTransactionByDisputeUuid(d.Uuid)
}

func (itm DisputeClaim) String() string {
	return fmt.Sprintf("/dispute/%s/%d/", itm.DisputeUuid, itm.ID)
}

func (itm DisputeClaim) Open() error {
	itm.Status = "OPEN"
	return itm.Save()
}

func (itm DisputeClaim) Close() error {
	itm.Status = "CLOSED"
	return itm.Save()
}

func (itm DisputeClaim) ResolveToVendor() error {
	itm.Status = "RESOLVED TO VENDOR"
	return itm.Save()
}

func (itm DisputeClaim) ResolveToBuyer() error {
	itm.Status = "RESOLVED TO BUYER"
	return itm.Save()
}

func (dispute Dispute) Open(userUuid string) error {
	dispute.Status = "OPEN"
	return dispute.Save()
}

func (dispute Dispute) Close(userUuid string) error {
	dispute.Status = "CLOSED"

	tx, err := FindTransactionByDisputeUuid(dispute.Uuid)
	if err != nil {
		return err
	}

	err = dispute.Save()
	if err != nil {
		return err
	}

	return tx.Complete("Dispute closed", userUuid)
}

func (dispute Dispute) ResolveToVendor(userUuid string) error {
	dispute.Status = "RESOLVED TO VENDOR"

	tx, err := FindTransactionByDisputeUuid(dispute.Uuid)
	if err != nil {
		return err
	}

	err = dispute.Save()
	if err != nil {
		return err
	}

	return tx.Release("Dispute resolved to vednor", userUuid)
}

func (dispute Dispute) ResolveToBuyer(userUuid string) error {
	dispute.Status = "RESOLVED TO BUYER"

	tx, err := FindTransactionByDisputeUuid(dispute.Uuid)
	if err != nil {
		return err
	}

	err = dispute.Save()
	if err != nil {
		return err
	}

	return tx.Cancel("Dispute resolved to buyer", userUuid)
}

/*
	Queries
*/

func FindDisputeByID(disputeUuid string) (*Dispute, error) {
	var dispute Dispute

	err := database.
		Preload("DisputeClaims").
		Preload("ResolverUser").
		First(&dispute, "uuid = ?", disputeUuid).
		Error

	if err != nil {
		return nil, err
	}

	return &dispute, nil
}

func FindDisputeClaimByID(disputeId uint) (*DisputeClaim, error) {
	var disputeClaim DisputeClaim

	err := database.
		First(&disputeClaim, "dispute_id = ?", disputeId).
		Error

	if err != nil {
		return nil, err
	}

	return &disputeClaim, nil
}

func (tx Transaction) CreateDispute(claim string) (*Dispute, error) {

	if tx.DisputeUuid != "" {
		return nil, errors.New("This tx already has dispute attached")
	}

	now := time.Now()
	dispute := Dispute{
		Uuid:      util.GenerateUuid(),
		Status:    "OPEN",
		CreatedAt: &now,
		UpdatedAt: &now,
	}

	err := dispute.Save()
	if err != nil {
		return nil, err
	}

	disputeClaim, err := CreateDisputeClaim(dispute, claim)
	if err != nil {
		return nil, err
	}

	dispute.DisputeClaims = []DisputeClaim{
		*disputeClaim,
	}

	tx.SetTransactionStatus(
		"FROZEN",
		tx.CurrentAmountPaid(),
		"Dispute initiated",
		tx.BuyerUuid,
		nil,
	)

	tx.DisputeUuid = dispute.Uuid
	err = tx.Save()
	if err != nil {
		return nil, err
	}

	EventNewDispute(dispute)
	return &dispute, nil
}

func CreateDisputeClaim(dispute Dispute, claim string) (*DisputeClaim, error) {
	disputeClaim := DisputeClaim{
		Claim:       claim,
		Status:      "OPEN",
		DisputeUuid: dispute.Uuid,
	}

	err := disputeClaim.Save()
	return &disputeClaim, err
}

func FindDisputesForUserUuid(userUuid string) []Dispute {
	var disputes []Dispute

	database.
		Joins("join transactions on disputes.uuid = transactions.dispute_uuid").
		Where("transactions.buyer_uuid = ? OR transactions.store_uuid = ?", userUuid, userUuid).
		Find(&disputes)

	return disputes
}

func CountDisputesForUserUuid(userUuid, status string) int {
	var count int

	query := database.
		Table("transactions").
		Joins("join disputes on disputes.uuid = transactions.dispute_uuid").
		Where("transactions.buyer_uuid = ? OR transactions.store_uuid = ?", userUuid, userUuid)

	if status != "" {
		query = query.Where("status = ?", status)
	}

	query.Count(&count)

	return count
}

func CountDisputesForStoreUuid(storeUuid, status string) int {
	var count int

	query := database.
		Table("transactions").
		Joins("join disputes on disputes.uuid = transactions.dispute_uuid").
		Where("transactions.store_uuid = ?", storeUuid)

	if status != "" {
		query = query.Where("status = ?", status)
	}

	query.Count(&count)

	return count
}
