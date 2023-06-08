package waitgroup

import "sync"

type WaitGroup struct {
	pool      chan byte
	buildinWG sync.WaitGroup
}

// Create
func Create(size int) *WaitGroup {
	return &WaitGroup{
		pool: make(chan byte, size),
	}
}

// BlockAdd ...
func (wg *WaitGroup) BlockAdd() {
	wg.pool <- 1
	wg.buildinWG.Add(1)
}

// Done ...
func (wg *WaitGroup) Done() {
	<-wg.pool
	wg.buildinWG.Done()
}

// Wait ...
func (wg *WaitGroup) Wait() {
	wg.buildinWG.Wait()
}
