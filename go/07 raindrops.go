/*
exercism.io go #7

Convert a number to a string, the contents of which depend on the number's
factors.

If the number has 3 as a factor, output 'Pling'.
If the number has 5 as a factor, output 'Plang'.
If the number has 7 as a factor, output 'Plong'.

If the number does not have 3, 5, or 7 as a factor, just pass the number's
digits straight through.
*/
package raindrops

import (
    "bytes"
    "strconv"
)

func Convert(input int) string {
    var buffer bytes.Buffer
    if input%3 == 0 {
        buffer.WriteString("Pling")
    }
    if input%5 == 0 {
        buffer.WriteString("Plang")
    }
    if input%7 == 0 {
        buffer.WriteString("Plong")
    }
    if buffer.String() == "" {
        return strconv.Itoa(input)
    } else {
        return buffer.String()
    }
}
