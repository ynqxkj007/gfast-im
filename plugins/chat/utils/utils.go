package utils

import "time"

var location *time.Location

func init() {
	location, _ = time.LoadLocation("Asia/Shanghai")
}

type Utils struct {
}

func NewUtils() *Utils {
	return &Utils{}
}

func (u *Utils) Location() *time.Location {
	return location
}

func (u *Utils) Now() time.Time {
	return time.Now().In(location)
}

func (u *Utils) Parse(t string, layout ...string) (result time.Time, err error) {
	if len(layout) > 0 {
		result, err = time.ParseInLocation(layout[0], t, u.Location())
	} else {
		result, err = time.ParseInLocation("2006-01-02 15:04:05", t, u.Location())
	}
	return
}
