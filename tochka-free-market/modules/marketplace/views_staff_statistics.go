package marketplace

import (
	"bytes"
	"strconv"
	"time"

	"github.com/gocraft/web"
	chart "github.com/wcharczuk/go-chart"

	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/util"
)

/*
	Statistics
*/

func getStats() []StatsItem {
	dt, _ := time.Parse(time.RFC3339, "2016-12-26T00:00:00+00:00")
	return CacheGetMarketplaceStats(dt)
}

func (c *Context) ViewStaffStats(w web.ResponseWriter, r *web.Request) {
	// User Statistics
	c.NumberOfUsers = CountUsers(nil)
	// Vendor Statistics
	c.NumberOfVendors = CountVendors(nil)
	c.NumberOfFreeVendors = CountFreeVendors(nil)
	c.NumberOfGoldVendors = CountGoldVendors(nil)
	c.NumberOfSilverVendors = CountSilverVendors(nil)
	c.NumberOfBronzeVendors = CountBronzeVendors(nil)
	// Item Statistrics
	c.NumberOfItems = CountItems()
	c.StatsItems = getStats()

	util.RenderTemplate(w, "staff/stats", c)
}

func (c *Context) ViewStatsNumberOfUsersGraph(w web.ResponseWriter, r *web.Request) {

	statsItems := getStats()

	xValues := []time.Time{}
	yValues := []float64{}

	for _, si := range statsItems {
		yValues = append(yValues, float64(si.NumberOfUsers))
		xValues = append(xValues, si.Date)
	}

	continuosSeries := chart.TimeSeries{
		XValues: xValues,
		YValues: yValues,
	}

	graph := chart.Chart{
		Series: []chart.Series{continuosSeries},
		XAxis: chart.XAxis{
			Style: chart.Style{
				Show: true,
			},
		},
		YAxis: chart.YAxis{
			Style: chart.Style{
				Show: true,
			},
		},
	}

	buffer := bytes.NewBuffer([]byte{})
	graph.Render(chart.PNG, buffer)

	w.Header().Set("Content-Type", "image/png")
	w.Header().Set("Content-Length", strconv.Itoa(len(buffer.Bytes())))
	w.Write(buffer.Bytes())
}

func (c *Context) ViewStatsNumberOfVendorsGraph(w web.ResponseWriter, r *web.Request) {

	statsItems := getStats()

	xValues := []time.Time{}
	yValues := []float64{}

	for _, si := range statsItems {
		yValues = append(yValues, float64(si.NumberOfVendors))
		xValues = append(xValues, si.Date)
	}

	continuosSeries := chart.TimeSeries{
		XValues: xValues,
		YValues: yValues,
	}

	graph := chart.Chart{
		Series: []chart.Series{continuosSeries},
		XAxis: chart.XAxis{
			Style: chart.Style{
				Show: true,
			},
		},
		YAxis: chart.YAxis{
			Style: chart.Style{
				Show: true,
			},
		},
	}

	buffer := bytes.NewBuffer([]byte{})
	graph.Render(chart.PNG, buffer)

	w.Header().Set("Content-Type", "image/png")
	w.Header().Set("Content-Length", strconv.Itoa(len(buffer.Bytes())))
	w.Write(buffer.Bytes())
}

func (c *Context) ViewStatsBTCTradeAmountGraph(w web.ResponseWriter, r *web.Request) {

	statsItems := getStats()

	xValues := []time.Time{}
	yValues := []float64{}

	for _, si := range statsItems {
		yValues = append(yValues, float64(si.BTCTradeAmount))
		xValues = append(xValues, si.Date)
	}

	continuosSeries := chart.TimeSeries{
		XValues: xValues,
		YValues: yValues,
	}

	graph := chart.Chart{
		Series: []chart.Series{continuosSeries},
		XAxis: chart.XAxis{
			Style: chart.Style{
				Show: true,
			},
		},
		YAxis: chart.YAxis{
			Style: chart.Style{
				Show: true,
			},
		},
	}

	buffer := bytes.NewBuffer([]byte{})
	graph.Render(chart.PNG, buffer)

	w.Header().Set("Content-Type", "image/png")
	w.Header().Set("Content-Length", strconv.Itoa(len(buffer.Bytes())))
	w.Write(buffer.Bytes())
}

func (c *Context) ViewStatsETHTradeAmountGraph(w web.ResponseWriter, r *web.Request) {

	statsItems := getStats()

	xValues := []time.Time{}
	yValues := []float64{}

	for _, si := range statsItems {
		yValues = append(yValues, float64(si.ETHTradeAmount))
		xValues = append(xValues, si.Date)
	}

	continuosSeries := chart.TimeSeries{
		XValues: xValues,
		YValues: yValues,
	}

	graph := chart.Chart{
		Series: []chart.Series{continuosSeries},
		XAxis: chart.XAxis{
			Style: chart.Style{
				Show: true,
			},
		},
		YAxis: chart.YAxis{
			Style: chart.Style{
				Show: true,
			},
		},
	}

	buffer := bytes.NewBuffer([]byte{})
	graph.Render(chart.PNG, buffer)

	w.Header().Set("Content-Type", "image/png")
	w.Header().Set("Content-Length", strconv.Itoa(len(buffer.Bytes())))
	w.Write(buffer.Bytes())
}

func (c *Context) ViewStatsBCHTradeAmountGraph(w web.ResponseWriter, r *web.Request) {

	statsItems := getStats()

	xValues := []time.Time{}
	yValues := []float64{}

	for _, si := range statsItems {
		yValues = append(yValues, float64(si.BCHTradeAmount))
		xValues = append(xValues, si.Date)
	}

	continuosSeries := chart.TimeSeries{
		XValues: xValues,
		YValues: yValues,
	}

	graph := chart.Chart{
		Series: []chart.Series{continuosSeries},
		XAxis: chart.XAxis{
			Style: chart.Style{
				Show: true,
			},
		},
		YAxis: chart.YAxis{
			Style: chart.Style{
				Show: true,
			},
		},
	}

	buffer := bytes.NewBuffer([]byte{})
	graph.Render(chart.PNG, buffer)

	w.Header().Set("Content-Type", "image/png")
	w.Header().Set("Content-Length", strconv.Itoa(len(buffer.Bytes())))
	w.Write(buffer.Bytes())
}

func (c *Context) ViewStatsNumberOfTransactionsGraph(w web.ResponseWriter, r *web.Request) {

	statsItems := getStats()

	xValues := []time.Time{}
	yValues := []float64{}

	for _, si := range statsItems {
		yValues = append(yValues,
			float64(si.NumberOfBTCTransactionsCreated)+
				float64(si.NumberOfBCHTransactionsCreated)+
				float64(si.NumberOfETHTransactionsCreated))
		xValues = append(xValues, si.Date)
	}

	continuosSeries := chart.TimeSeries{
		XValues: xValues,
		YValues: yValues,
	}

	graph := chart.Chart{
		Series: []chart.Series{continuosSeries},
		XAxis: chart.XAxis{
			Style: chart.Style{
				Show: true,
			},
		},
		YAxis: chart.YAxis{
			Style: chart.Style{
				Show: true,
			},
		},
	}

	buffer := bytes.NewBuffer([]byte{})
	graph.Render(chart.PNG, buffer)

	w.Header().Set("Content-Type", "image/png")
	w.Header().Set("Content-Length", strconv.Itoa(len(buffer.Bytes())))
	w.Write(buffer.Bytes())
}
