/*
exercism.io go #17

Manage robot factory settings.

When robots come off the factory floor, they have no name.

The first time you boot them up, a random name is generated in the format of
two uppercase letters followed by three digits, such as RX837 or BC811.

Every once in a while we need to reset a robot to its factory settings, which
means that their name gets wiped. The next time you ask, it will respond with
a new random name.

The names must be random: they should not follow a predictable sequence.
Random names means a risk of collisions. Your solution must ensure that every
existing robot has a unique name.
*/
package robotname

import (
	"bytes"
	"math/rand"
)

type Robot struct {
	name string
}

var robotMap = map[string]bool{}

const maxNames = 26 * 26 * 9 * 9 * 9

func (rob *Robot) Name() string {
	if len(robotMap) >= maxNames {
		panic("Too many names!")
	}

	if rob.name == "" {
		rob.name = randNameUnique()
		robotMap[rob.name] = true
	}

	return rob.name
}

func (rob *Robot) Reset() {
	rob.name = ""
}

func randName() string {
	var buffer bytes.Buffer
	buffer.WriteRune(randLetter())
	buffer.WriteRune(randLetter())
	buffer.WriteRune(randNumber())
	buffer.WriteRune(randNumber())
	buffer.WriteRune(randNumber())
	return buffer.String()
}

func randNameUnique() string {
	s := randName()
	for robotMap[s] {
		s = randName()
	}
	return s
}

func randLetter() rune {
	return rune('A' + rand.Intn(26))
}

func randNumber() rune {
	return rune('0' + rand.Intn(9))
}
