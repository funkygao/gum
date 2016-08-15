package models

import (
	"fmt"
	"strings"
)

func joinInts(a []int, delim string) string {
	return strings.Trim(strings.Replace(fmt.Sprint(a), " ", delim, -1), "[]")
}
