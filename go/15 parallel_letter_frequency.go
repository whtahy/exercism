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
