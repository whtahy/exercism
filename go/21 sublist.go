package sublist

type Relation string

func Sublist(listA, listB []int) Relation {
    var rel Relation

    // assert len(listA) < len(listB)
    if len(listA) < len(listB) {
        rel = "sublist"
    } else if len(listA) == len(listB) {
        rel = "equal"
    } else {
        rel = "superlist"
        listA, listB = listB, listA
    }

    // sliding window
    for i := 0; i <= len(listB)-len(listA); i++ {
        if equals(listA, listB[i:i+len(listA)]) {
            return rel
        }
    }

    // default Relation
    return "unequal"
}

func equals(listA, listB []int) bool {
    // assume len(listA) == len(listB)
    for i := range listA {
        if listA[i] != listB[i] {
            return false
        }
    }
    return true // includes empty lists
}
