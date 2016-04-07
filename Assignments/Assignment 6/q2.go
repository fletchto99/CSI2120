package main

import (
  "bufio"
  "os"
  "time"
  "fmt"
  "runtime"
)

func readWords(path string, sleepTime time.Duration) (ch chan string) {

    file, err := os.Open(path)
    if err != nil {
        return nil
    }

    ch = make(chan string)
    go func() {
        defer func() {
            file.Close()
            close(ch)
        }()

        scanner := bufio.NewScanner(file)
        onSpace := func(data []byte, atEOF bool) (advance int, token []byte, err error) {
            for i := 0; i < len(data); i++ {
                if data[i] == ' ' || data[i] == '\n' {
                    return i + 1, data[:i], nil
                }
            }
            return 0, data, bufio.ErrFinalToken
        }
        scanner.Split(onSpace)
        for scanner.Scan() {
            time.Sleep(sleepTime*time.Millisecond)
            s := scanner.Text()
            if (len(s) > 0) {
                ch <-  s + " "
            } 
        }
    }()
    return
}

func writeWords(path string, timeout time.Duration, inpOne <-chan string, inpTwo <-chan string) (ch chan string) {
    file, err := os.Create(path)
    if err != nil {
        return
    }

    ch = make(chan string)

    go func() {
        w := bufio.NewWriter(file)
        defer func() {
            w.Flush()
            file.Close()
        }()

        timer := time.NewTimer(time.Second * 2)
        Outer: 
            for {
                select{
                    case str, open := <- inpOne:
                        if open {
                            w.WriteString(str)
                            ch <- "Writing string: " + str
                        } else if  inpTwo == nil {
                            ch <- "Complete"
                            close(ch)
                            break Outer
                        } else {
                            ch <- "Input one empty"
                            inpOne = nil
                        }
                    case str, openTwo := <- inpTwo:
                        if openTwo {
                            w.WriteString(str)
                            ch <- "Writing string: " + str
                        }  else if  inpOne == nil {
                            ch <- "Complete"
                            close(ch)
                            break Outer
                        } else {
                            ch <- "Input two empty"
                            inpTwo = nil
                        }
                    case <- timer.C:
                        ch <- "Writing linebreak"
                        w.WriteString("\n")
                        timer.Reset(timeout * time.Millisecond)
                }
            }
    }()
    return
}

func main() {
    runtime.GOMAXPROCS(4)
    inOne := readWords("one.txt", 200)
    inTwo := readWords("two.txt", 300)
    out := writeWords("output.txt", 2000, inOne, inTwo)
    
    open := true
    for open {
        var s string
        s, open = <-out
        if open {
            fmt.Println(s)
        }
    }
}