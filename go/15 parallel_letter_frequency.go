/*
exercism.io go #15

Count the frequency of letters in texts using parallel computation.

Parallelism is about doing things in parallel that can also be done
sequentially. A common example is counting the frequency of letters. Create a
function that returns the total frequency of each letter in a list of texts
and that employs parallelism.
*/
package letter

/*
type FreqMap map[rune]int

func Frequency(s string) FreqMap {
	m := FreqMap{}
	for _, r := range s {
		m[r]++
	}
	return m
}
*/

func ConcurrentFrequency(stringSlice []string) FreqMap {
	ch := make(chan FreqMap, len(stringSlice))
	for _, text := range stringSlice {
		go func(s string) {
			ch <- Frequency(s)
		}(text)
	}

	totalMap := make(FreqMap)
	for range stringSlice {
		totalMap.merge(<-ch)
	}

	return totalMap
}

func (fmapA FreqMap) merge(fmapB FreqMap) {
	for k, v := range fmapB {
		fmapA[k] += v
	}
}

/*
func SequentialFrequency(stringSlice []string) FreqMap {
	var buffer bytes.Buffer
	for _, text := range stringSlice {
		buffer.WriteString(text)
	}
	return Frequency(buffer.String())
}
*/
