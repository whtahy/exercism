/*
exercism.io go #14

Reverse a string

For example: input: "cool" output: "looc"
*/
package reverse

import "bytes"

func String(s string) string {
	var buffer bytes.Buffer
	for i := len(s) - 1; i >= 0; i-- {
		buffer.WriteByte(s[i])
	}
	return buffer.String()
}
