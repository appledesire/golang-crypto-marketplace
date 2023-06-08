package util

import (
	"strings"
	"time"

	"github.com/dustin/go-humanize"
)

func HumanizeTimeRU(t time.Time) string {
	lczd := humanize.Time(t)
	lczd = strings.Replace(lczd, "days", "д.", -1)
	lczd = strings.Replace(lczd, "day", "д.", -1)
	lczd = strings.Replace(lczd, "hours", "ч.", -1)
	lczd = strings.Replace(lczd, "hour", "ч.", -1)
	lczd = strings.Replace(lczd, "weeks", "нед.", -1)
	lczd = strings.Replace(lczd, "week", "нед.", -1)
	lczd = strings.Replace(lczd, "months", "мес.", -1)
	lczd = strings.Replace(lczd, "month", "мес.", -1)
	lczd = strings.Replace(lczd, "minutes", "мин.", -1)
	lczd = strings.Replace(lczd, "minute", "мин.", -1)
	lczd = strings.Replace(lczd, "years", "г.", -1)
	lczd = strings.Replace(lczd, "year", "г.", -1)
	lczd = strings.Replace(lczd, "seconds", "сек.", -1)
	lczd = strings.Replace(lczd, "second", "сек.", -1)
	lczd = strings.Replace(lczd, "ago", "назад", -1)
	return lczd
}

func HumanizeTime(t time.Time, lang string) string {
	lczd := humanize.Time(t)
	if lang == "ru" {
		lczd = strings.Replace(lczd, "days", "д.", -1)
		lczd = strings.Replace(lczd, "day", "д.", -1)
		lczd = strings.Replace(lczd, "hours", "ч.", -1)
		lczd = strings.Replace(lczd, "hour", "ч.", -1)
		lczd = strings.Replace(lczd, "weeks", "нед.", -1)
		lczd = strings.Replace(lczd, "week", "нед.", -1)
		lczd = strings.Replace(lczd, "months", "мес.", -1)
		lczd = strings.Replace(lczd, "month", "мес.", -1)
		lczd = strings.Replace(lczd, "minutes", "мин.", -1)
		lczd = strings.Replace(lczd, "minute", "мин.", -1)
		lczd = strings.Replace(lczd, "years", "г.", -1)
		lczd = strings.Replace(lczd, "year", "г.", -1)
		lczd = strings.Replace(lczd, "seconds", "сек.", -1)
		lczd = strings.Replace(lczd, "second", "сек.", -1)
		lczd = strings.Replace(lczd, "ago", "назад", -1)
		lczd = strings.Replace(lczd, "from now", "", -1)
	}
	return lczd
}
