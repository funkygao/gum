package models

import (
	"testing"

	"github.com/funkygao/assert"
)

func TestJoinInts(t *testing.T) {
	a := []int{3, 8, 19}
	assert.Equal(t, "3,8,19", joinInts(a, ","))

	a = []int{}
	assert.Equal(t, "", joinInts(a, " "))
}
