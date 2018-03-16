package twelve

import (
    "bytes"
    "fmt"
)

const (
    template = "On the %s day of Christmas my true love gave to me, %s."
    penult   = "and "
    giftSep  = ", "
    verseSep = "\n"
    nDays    = 12
)

var daySlice = []string{
    "off by 1!",
    "first",
    "second",
    "third",
    "fourth",
    "fifth",
    "sixth",
    "seventh",
    "eighth",
    "ninth",
    "tenth",
    "eleventh",
    "twelfth",
}

var giftSlice = []string{
    "off by 1!",
    "a Partridge in a Pear Tree",
    "two Turtle Doves",
    "three French Hens",
    "four Calling Birds",
    "five Gold Rings",
    "six Geese-a-Laying",
    "seven Swans-a-Swimming",
    "eight Maids-a-Milking",
    "nine Ladies Dancing",
    "ten Lords-a-Leaping",
    "eleven Pipers Piping",
    "twelve Drummers Drumming",
}

func Song() string {
    var buf bytes.Buffer
    for i := 1; i <= nDays; i++ {
        buf.WriteString(Verse(i) + verseSep)
    }
    return buf.String()
}

func Verse(n int) string {
    // 1 gift
    if n == 1 {
        return fmt.Sprintf(template, daySlice[n], giftSlice[n])
    }

    // more than 1 gift
    var buf bytes.Buffer
    for i := n; i >= 2; i-- {
        buf.WriteString(giftSlice[i] + giftSep)
    }
    // last gift
    buf.WriteString(penult + giftSlice[1])

    return fmt.Sprintf(template, daySlice[n], buf.String())
}
