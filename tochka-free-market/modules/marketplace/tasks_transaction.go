package marketplace

import (
	"github.com/helloyi/go-waitgroup"
	"github.com/robfig/cron"

	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/util"
)

// TaskCleanInactiveReservations is a cron job that runs every 5 minutes.
// Deletes inactive reservations.
func TaskCleanInactiveReservations() {
	inactiveReservations := FindInactiveReservations()
	util.Log.Debug("[Task] [TaskCleanInactiveReservations] # of items: %d", len(inactiveReservations))
	for _, r := range inactiveReservations {
		transaction := r.Transaction
		if transaction.IsFailed() && transaction.IsCancelled() {
			transaction.SetTransactionStatus(
				"FAILED",
				transaction.CurrentAmountPaid(),
				"Transaction failed because no coins were transferred",
				"",
				nil,
			)
		}
		r.Remove()
	}
}

// TaskUpdatePendingTransactions is a cron job that runs every 5 minutes.
// Checks for balance and updates transaction status.
func TaskUpdatePendingTransactions() {
	it := FindPendingTransactions()
	util.Log.Debug("[Task] [TaskUpdatePendingTransactions] # of items: %d", len(it))
	for _, t := range it {
		t.UpdateTransactionStatus()
	}
}

// TaskFailOldPendingTransactions is a cron job that runs every 5 minutes.
// Updates status of old pending payments
func TaskFailOldPendingTransactions() {
	it := FindOldPendingTransactions()
	util.Log.Debug("[Task] [TaskFailOldPendingTransactions] # of items: %d", len(it))
	for _, t := range it {
		t.Fail("Escrow failed automatically", "")
	}
}

// FindStalledCompletedTransactions is a cron job that runs every 5 minutes.
// Updates status of old pending payments
func TaskFreezeStalledCompletedTransactions() {
	it := FindStalledCompletedTransactions()
	util.Log.Debug("[Task] [FindStalledCompletedTransactions] # of items: %d", len(it))
	for _, t := range it {
		t.Freeze("Frozen due to inactivity", "")
	}
}

// TaskReleaseConfirmedTransactions is a cron job that runs every 5 minutes.
// Releases funds to seller of confirmed transaction.
func TaskReleaseOldCompletedTransactions() {
	it := FindOldCompletedTransactions()
	util.Log.Debug("[Task] [TaskReleaseOldCompletedTransactions] # of items: %d", len(it))
	for _, t := range it {
		t.Release("Escrow released automatically", "")
	}
}

func TaskUpdateBalancesOrRecentlyReleasedAndCancelledTransactions() {
	wg := waitgroup.Create(16)
	ts := FindRecentlyCancelledAndReleasedTransactions()
	util.Log.Debug("[Task] [TaskUpdateBalancesOrRecentlyReleasedAndCancelledTransactions] # of items: %d", len(ts))

	for i := range ts {
		t := ts[i]
		wg.BlockAdd()
		go func(t *Transaction) {
			defer wg.Done()
			t.UpdateTransactionStatus()
		}(&t)
	}

	wg.Wait()

}

func TaskFinalizeReleasedAndCancelledTransactionsWithNonZeroAmount() {

	it := FindReleasedAndCancelledTransactionsWithNonZeroAmount()
	wg := waitgroup.Create(16)

	util.Log.Debug("[Task] [TaskFinalizeReleasedAndCancelledTransactionsWithNonZeroAmount] # of items: %d", len(it))
	for i := range it {
		t := it[i]
		wg.BlockAdd()
		go func(t *Transaction) {
			defer wg.Done()
			if t.CurrentPaymentStatus() == "CANCELLED" {
				t.Cancel("Tx cancelled automatically", "")
			}
			if t.CurrentPaymentStatus() == "RELEASED" {
				t.Release("Tx released automatically", "")
			}
			t.UpdateTransactionStatus()
		}(&t)
	}

	wg.Wait()
}

func StartTransactionsCron() {
	c := cron.New()
	c.AddFunc("@every 10m", TaskCleanInactiveReservations)
	c.AddFunc("@every 1m", TaskUpdatePendingTransactions)
	c.AddFunc("@every 10m", TaskFailOldPendingTransactions)
	c.AddFunc("@every 10m", TaskFreezeStalledCompletedTransactions)
	c.AddFunc("@every 10m", TaskReleaseOldCompletedTransactions)
	c.AddFunc("@every 10m", TaskUpdateBalancesOrRecentlyReleasedAndCancelledTransactions)
	c.AddFunc("@hourly", TaskFinalizeReleasedAndCancelledTransactionsWithNonZeroAmount)
	c.Start()
}
