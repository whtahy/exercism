package tree

import (
    "errors"
    "sort"
)

type Record struct {
    ID, Parent int
}

type Node struct {
    ID       int
    Children []*Node
}

func Build(records []Record) (*Node, error) {
    if len(records) <= 0 {
        return nil, nil
    }

    sort.Slice(records,
        func(l, r int) bool {
            return records[l].ID < records[r].ID
        })

    if records[0].ID != 0 {
        return nil, errors.New("no root node")
    }
    if records[0].Parent != 0 {
        return nil, errors.New("root node has parent")
    }
    if records[len(records)-1].ID >= len(records) {
        return nil, errors.New("record ID out of bounds")
    }

    nodes := make([]Node, len(records))

    for i := 1; i < len(records); i++ {
        p := records[i].Parent

        if i <= p {
            return nil, errors.New("record ID <= parent ID")
        }

        nodes[i].ID = i
        nodes[p].Children = append(nodes[p].Children, &nodes[i])
    }

    return &nodes[0], nil
}
