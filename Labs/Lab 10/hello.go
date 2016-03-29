package main

import "fmt"

func main() {
    var a, b int
    fmt.Print("Input Number a: ")
    fmt.Scanf("%d", &a)
    fmt.Print("Input Number b: ")
    fmt.Scanf("%d", &b)
    switch {
    case a < b && b < 2:
        fmt.Println("a is smaller than 2")
        fallthrough
    case a < b && b < 10:
        fmt.Println("a is smaller than 10")
        fallthrough
    case a < b:
        fmt.Println("a is smaller than b")
    default:
        fmt.Println("a is NOT smaller than b")
    }
}