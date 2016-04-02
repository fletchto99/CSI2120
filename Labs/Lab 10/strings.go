package main

import (
    "fmt"
)

func main() {
    // Count the number of consonants in a string: a, e, i, o, u
    text := "The School of Electrical Engineering and Computer Science was formed in 1997 by the merger of the Department of Computer Science and of the Department of Electrical and Computer Engineering. The School of EECS is the University of Ottawa's centre for research and teaching in all areas related to computing, computers and communications. This interdisciplinary school combines four cutting-edge programs: electrical engineering, software engineering, computer engineering and computer science."

    // strings package
    fmt.Printf("%d number of a\n", count(text, "a") + count(text,"A"))
    fmt.Printf("%d number of e\n", count(text, "e") + count(text, "E"))
    fmt.Printf("%d number of i\n", count(text, "i") + count(text, "I"))
    fmt.Printf("%d number of o\n", count(text, "o") + count(text, "O"))
    fmt.Printf("%d number of u\n", count(text, "u") + count(text, "U"))
}

func count(str string, a string) int {
    sum := 0
    for c := range str {
        if c == a {
            sum += 1
        }
    }
    return sum
}