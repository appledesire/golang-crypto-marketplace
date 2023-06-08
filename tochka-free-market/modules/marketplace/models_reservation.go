package marketplace

import (
	"time"
)

/*
	Models
*/

type Reservation struct {
	Uuid            string        `json:"uuid" gorm:"primary_key"`
	EndsOn          time.Time     `json:"ends_on"`
	Duration        time.Duration `json:"duration" sql:"-"`
	TransactionUuid string        `json:"transaction_uuid" sql:"index"`

	Transaction Transaction `json:"-"`
}

type Reservations []Reservation

func (itms Reservations) Where(fnc func(Reservation) bool) Reservations {
	filtered := Reservations{}
	for _, i := range itms {
		if fnc(i) {
			filtered = append(filtered, i)
		}
	}
	return filtered
}

/*
	Model Methods
*/

func (r Reservation) CreatedAt() time.Time {
	transaction := r.Transaction
	createdAt := transaction.CreatedAt()
	return createdAt
}

func (r Reservation) IsCompleted() bool {
	transaction := r.Transaction
	return transaction.IsCompleted()
}

func (r Reservation) IsActive() bool {
	transaction := r.Transaction
	if transaction.IsCompleted() {
		return false
	}
	if transaction.IsReleased() {
		return false
	}
	if time.Now().Before(r.EndsOn) {
		return true
	}
	return false
}

/*
	Database methods
*/

func (r Reservation) Save() error {
	return r.SaveToDatabase()
}

func (itm Reservation) SaveToDatabase() error {
	if existing, _ := FindReservationByUuid(itm.Uuid); existing == nil {
		return database.Create(&itm).Error
	}
	return database.Save(&itm).Error
}

func (r Reservation) Remove() error {
	return database.Delete(r).Error
}

/*
	Queries
*/

func CreateReservation(a Package, t Transaction) (*Reservation, error) {
	duration, _ := time.ParseDuration("3h")
	reservation := Reservation{
		Uuid:            a.Uuid,
		TransactionUuid: t.Uuid,
		EndsOn:          time.Now().Add(duration),
	}
	return &reservation, reservation.Save()
}

func GetAllResevations() Reservations {
	var reservations []Reservation
	database.
		Preload("Transaction").
		Preload("Transaction.Status").
		Find(&reservations)
	return Reservations(reservations)
}

func FindActiveReservationsForBuyer(uuid string) Reservations {
	return FindActiveReservations().Where(func(r Reservation) bool {
		return r.Transaction.BuyerUuid == uuid
	})
}

func FindReservationByUuid(uuid string) (*Reservation, error) {
	var item Reservation
	err := database.
		Where(&Reservation{Uuid: uuid}).
		Preload("Transaction").
		Preload("Transaction.Status").
		First(&item).
		Error
	if err != nil {
		return nil, err
	}
	return &item, err
}

func FindInactiveReservations() Reservations {
	return GetAllResevations().Where(func(r Reservation) bool {
		transaction := r.Transaction
		return !r.IsActive() && !transaction.IsCompleted() && !transaction.IsReleased()
	})
}

func FindActiveReservations() Reservations {
	return GetAllResevations().Where(func(r Reservation) bool {
		return r.IsActive()
	})
}
