package main

import (
  "bufio"
  "os"
  "time"
  "fmt"
  "runtime"
)

/*
 * Reads the words from a file, delimmeted by a newline and a space
 * 
 * path - The path to the file
 * sleepTime - The time in miliseconds to sleep
 *
 * Returns a channel of type string which will contain all of the strings of the file
 */
func readWords(path string, sleepTime time.Duration) (ch chan string) {

    file, err := os.Open(path)
    if err != nil {
        return nil
    }

    //create the channel
    ch = make(chan string)

    //concurrently push to channel
    go func() {

        //close the file and channel when complete
        defer func() {
            file.Close()
            close(ch)
        }()

        //scan the file
        scanner := bufio.NewScanner(file)

        //Use spaces and newlines as delimmeters
        scanner.Split(func(data []byte, atEOF bool) (advance int, token []byte, err error) {
            for i := 0; i < len(data); i++ {
                if data[i] == ' ' || data[i] == '\n' {
                    return i + 1, data[:i], nil
                }
            }
            return 0, data, bufio.ErrFinalToken
        })

        //Scan the contents of the text file
        for scanner.Scan() {
            //Wait the time requested
            time.Sleep(sleepTime*time.Millisecond)
            s := scanner.Text()

            //If the input is valid send it to the channel
            if (len(s) > 0) {
                ch <-  s + " "
            } 
        }
    }()
    return
}

/*
 * Writes words from two seperate channels to a file, adding a new line at the end of each timeout
 * 
 * path - The path to the file to write
 * timeout - The time in miliseconds before adding a linebreak
 * inpOne - A output channel which will contain the strings to write
 * inpOne - A output channel which will contain the second set of strings to write
 *
 * Returns a channel of type string which will contain debugging information
 */
func writeWords(path string, timeout time.Duration, inpOne <-chan string, inpTwo <-chan string) (ch chan string) {
    file, err := os.Create(path)
    if err != nil {
        return
    }

    ch = make(chan string)

    go func() {
        w := bufio.NewWriter(file)
        defer func() {
            //done!
            ch <- "Complete"

            //flush & close the buffer
            w.Flush()
            file.Close()

            //close the channel
            close(ch)
        }()

        //timer to write linebreak
        timer := time.NewTimer(time.Second * 2)

        //Label to break loop from within select statement
        Outer: 
            for {
                select{
                    case str, open := <- inpOne:

                        //write to the buffer while there is data, otherwise sets the channel to nil
                        if open {
                            w.WriteString(str)
                            ch <- "Writing string: " + str
                        } else if  inpTwo == nil {
                            break Outer
                        } else {
                            ch <- "Input one empty"
                            inpOne = nil
                        }
                    case str, openTwo := <- inpTwo:

                        //write to the buffer while there is data, otherwise sets the channel to nil
                        if openTwo {
                            w.WriteString(str)
                            ch <- "Writing string: " + str
                        }  else if  inpOne == nil {
                            break Outer
                        } else {
                            ch <- "Input two empty"
                            inpTwo = nil
                        }
                    case <- timer.C:

                        //write a linebreak to the buffer when the time is up
                        ch <- "Writing linebreak"
                        w.WriteString("\n")

                        //reset the timer
                        timer.Reset(timeout * time.Millisecond)
                }
            }
    }()
    return
}

func main() {
    //User 4 cores if possible
    runtime.GOMAXPROCS(4)

    //create reader channels
    inOne := readWords("one.txt", 200)
    inTwo := readWords("two.txt", 300)

    //create writer channel and pass it the reader channels
    out := writeWords("output.txt", 2000, inOne, inTwo)
    
    //While we are writing the data block (and output debug info)
    open := true
    for open {
        var s string
        s, open = <-out
        if open {
            fmt.Println(s)
        }
    }
}