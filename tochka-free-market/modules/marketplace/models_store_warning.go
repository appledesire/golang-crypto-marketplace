package marketplace

import (
	"errors"
	"fmt"
	"strings"
	"time"

	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/util"
)

/*
	Warning Expiration Dates
*/

const (
	RED_WARNING_EXPIRATION    = "2190h"
	YELLOW_WARNING_EXPIRATION = "1460h"
	GREEN_WARNING_EXPIRATION  = "730h"
)

var (
	RED_WARNING_DURATION, _    = time.ParseDuration(RED_WARNING_EXPIRATION)
	YELLOW_WARNING_DURATION, _ = time.ParseDuration(YELLOW_WARNING_EXPIRATION)
	GREEN_WARNING_DURATION, _  = time.ParseDuration(GREEN_WARNING_EXPIRATION)
)

/*
	Models
*/

type StoreWarning struct {
	Uuid string `json:"uuid" gorm:"primary_key"`

	StoreUuid    string `json:"store_uuid" gorm:"index"`
	Severety     string `json:"severety" gorm:"index"`
	Text         string `json:"text"`
	IsApproved   bool   `json:"is_approved" gorm:"index"`
	ReporterUuid string `json:"reporter_uuid" gorm:"index"`

	Store    Store `json:"-"`
	Reporter User  `json:"-"`

	CreatedAt *time.Time `json:"created_at"`
	UpdatedAt *time.Time `json:"updated_at"`
	DeletedAt *time.Time `json:"deleted_at"`
}

/*
	Database methods
*/

func (w StoreWarning) Validate() error {
	if w.Uuid == "" {
		return errors.New("Empty Public Key")
	}
	if w.StoreUuid == "" {
		return errors.New("Empty Store Uuid")
	}
	if w.Severety == "" {
		return errors.New("Empty Severety")
	}
	if w.Text == "" {
		return errors.New("Empty Text")
	}
	if w.ReporterUuid == "" {
		return errors.New("Empty Reporter User Uuid")
	}
	return nil
}

func (w StoreWarning) Save() error {
	err := w.Validate()
	if err != nil {
		return err
	}
	return w.SaveToDatabase()
}

func (w StoreWarning) Remove() error {
	return database.Delete(w).Error
}

func (w StoreWarning) SaveToDatabase() error {
	if existing, _ := FindStoreWarningByUuid(w.Uuid); existing == nil {
		return database.Create(&w).Error
	}
	return database.Save(&w).Error
}

/*
	Model Methods
*/

func (w StoreWarning) HasExpired() bool {

	switch w.Severety {
	case "RED":
		return w.CreatedAt.Before(time.Now().Add(-RED_WARNING_DURATION))
	case "YELLOW":
		return w.CreatedAt.Before(time.Now().Add(-YELLOW_WARNING_DURATION))
	case "GREEN":
		return w.CreatedAt.Before(time.Now().Add(-GREEN_WARNING_DURATION))
	}

	return false
}

func (w StoreWarning) ExpiresIn(lang string) string {

	switch w.Severety {
	case "RED":
		return util.HumanizeTime(w.CreatedAt.Add(RED_WARNING_DURATION), lang)
	case "YELLOW":
		return util.HumanizeTime(w.CreatedAt.Add(YELLOW_WARNING_DURATION), lang)
	case "GREEN":
		return util.HumanizeTime(w.CreatedAt.Add(GREEN_WARNING_DURATION), lang)
	}

	return ""
}

/*
	Model Methods
*/

func CreateStoreWarning(storeUuid, reporterUuid, text string) (StoreWarning, error) {
	now := time.Now()
	uw := StoreWarning{
		Uuid:         util.GenerateUuid(),
		StoreUuid:    storeUuid,
		ReporterUuid: reporterUuid,
		Text:         text,
		Severety:     "NEW",
		CreatedAt:    &now,
	}
	return uw, uw.Save()
}

func (uw *StoreWarning) UpdateSeverety(severety string) error {
	uw.Severety = severety
	uw.IsApproved = true
	return uw.Save()
}

/*
	View Models
*/

type ViewStoreWarning struct {
	*StoreWarning
	ViewStore    ViewStore
	CreatedAtStr string
	ExpiresIn    string
	HasExpired   bool
}

type StoreWarnings []StoreWarning

func (uw StoreWarning) ViewStoreWarning(lang string) ViewStoreWarning {
	vw := ViewStoreWarning{
		StoreWarning: &uw,
		CreatedAtStr: util.HumanizeTime(*uw.CreatedAt, lang),
		ExpiresIn:    uw.ExpiresIn(lang),
		HasExpired:   uw.HasExpired(),
		ViewStore:    uw.Store.ViewStore(lang),
	}
	return vw
}

func (uws StoreWarnings) ViewStoreWarnings(lang string) []ViewStoreWarning {
	vuws := []ViewStoreWarning{}
	for _, uw := range uws {
		if !uw.HasExpired() {
			vuw := uw.ViewStoreWarning(lang)
			vuws = append(vuws, vuw)
		}
	}
	return vuws
}

/*
	Queries
*/

func FindStoreWarningByUuid(uuid string) (*StoreWarning, error) {
	var StoreWarning StoreWarning
	err := database.
		Where("uuid = ?", uuid).
		Preload("Store").
		Preload("Reporter").
		First(&StoreWarning).
		Error
	if err != nil {
		return nil, err
	}
	return &StoreWarning, err
}

func FindStoreWarningsForStore(userUuid string) StoreWarnings {
	var warnings StoreWarnings
	database.
		Table("store_warnings").
		Where("store_uuid = ?", userUuid).
		Preload("Store").
		Preload("Reporter").
		Find(&warnings)
	return warnings
}

func FindStoreWarningsForUser(userUuid string) StoreWarnings {
	var warnings StoreWarnings
	database.
		Table("store_warnings").
		Where("user_uuid = ?", userUuid).
		Preload("Store").
		Preload("Reporter").
		Find(&warnings)
	return warnings
}

func countWarningsForStore(storeUuid, color, expirationDuration string, expired bool) int {

	convertGoIntervalToPgInterval := func(interval string) string {
		return strings.Replace(interval, "h", " hours", -1)
	}

	var count int

	query := database.
		Table("store_warnings").
		Where("is_approved = ?", true).
		Where("deleted_at is null").
		Where("store_uuid = ?", storeUuid)

	if color != "" {
		query = query.Where("severety = ?", color)
	}

	if expirationDuration != "" {
		sign := "<"
		if expired {
			sign = ">="
		}
		query = query.Where(fmt.Sprintf("now() - created_at %s interval '%s'", sign, convertGoIntervalToPgInterval(expirationDuration)))
	}

	query.Count(&count)
	return count
}

func CountActiveWarningsForStore(storeUuid string) int {
	return CountRedWarningsForStore(storeUuid, false) + CountGreenWarningsForStore(storeUuid, false) + CountYellowWarningsForStore(storeUuid, false)
}

func CountExpiredWarningsForStore(storeUuid string) int {
	return CountRedWarningsForStore(storeUuid, true) + CountGreenWarningsForStore(storeUuid, true) + CountYellowWarningsForStore(storeUuid, true)
}

func CountRedWarningsForStore(storeUuid string, expired bool) int {
	return countWarningsForStore(storeUuid, "RED", RED_WARNING_EXPIRATION, expired)
}

func CountGreenWarningsForStore(storeUuid string, expired bool) int {
	return countWarningsForStore(storeUuid, "GREEN", GREEN_WARNING_EXPIRATION, expired)
}

func CountYellowWarningsForStore(storeUuid string, expired bool) int {
	return countWarningsForStore(storeUuid, "YELLOW", YELLOW_WARNING_EXPIRATION, expired)
}

func FindAllActiveWarnings() StoreWarnings {
	var warnings StoreWarnings
	database.
		Table("store_warnings").
		Order("created_at DESC").
		Preload("Store").
		Preload("Reporter").
		Find(&warnings)
	return warnings
}

/*
	Utility Methods
*/

func CanUserReportStore(user User, store Store) bool {
	if user.IsAdmin || user.IsStaff {
		return true
	}
	return CountPayedTransactionsForBuyerAndSeller(user.Uuid, store.Uuid) > 0
}
