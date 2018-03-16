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
