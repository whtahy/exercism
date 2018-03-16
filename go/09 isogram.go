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
