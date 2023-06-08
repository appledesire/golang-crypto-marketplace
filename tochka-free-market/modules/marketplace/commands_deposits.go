package marketplace

func CommandUpdateDeposits() {
	deposits := FindAllDeposits()
	for _, d := range deposits {
		d.Update()
	}
}
