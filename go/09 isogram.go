/*
exercism.io go #9

Determine if a word or phrase is an isogram.

An isogram (also known as a "nonpattern word") is a word or phrase without a
repeating letter.

Examples of isograms:

lumberjacks
background
downstream

The word isograms, however, is not an isogram, because the s repeats.
*/
package isogram

import "strings"

func IsIsogram(word string) bool {
	var letterMap = make(map[rune]bool, len(word))
	word = strings.ToUpper(word)
	for _, letter := range word {
		if letterMap[letter] {
			return false
		}
		if letter >= 'A' && letter <= 'Z' {
			letterMap[letter] = true
		}
	}
	return true
}
