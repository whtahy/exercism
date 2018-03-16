package hamming

import "errors"

func Distance(a, b string) (int, error) {
    count := 0
    if len(a) != len(b) {
        return count, errors.New("len(a) != len(b)")
    }
    for i := range a {
        if a[i] != b[i] {
            count += 1
        }
    }
    return count, nil
}
