package marketplace

func GetStoreVerificationThread(store Store, createIfNotExists bool) (*Thread, error) {
	threadUuid := "store-verification-" + store.Uuid
	thread, _ := FindThreadByUuid(threadUuid)
	if thread != nil && thread.Type == "store-verification" {
		return thread, nil
	}
	return CreateThread(
		"store-verification",
		threadUuid,
		"Store verification Thread @"+store.Storename,
		"",
		nil,
		nil,
		createIfNotExists,
	)
}

/*
	DB Views
*/

func setupVendorVerificationThreadsFunctions() {
	database.Exec("DROP VIEW IF EXISTS v_verification_threads CASCADE;")
	database.Exec(`
		CREATE VIEW v_verification_threads AS (
			SELECT 
				v_threads.uuid,
				(u2.is_admin or u2.is_staff) as last_message_by_staff
			FROM v_threads
			JOIN messages m on m.uuid=last_message_uuid
			JOIN users u2 on u2.uuid=m.sender_user_uuid
			WHERE v_threads.type='store-verification'
	);
	`)
}
