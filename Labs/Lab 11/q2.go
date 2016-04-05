package main

import (
    "fmt"
)

type dog struct {
  name string
  race string
  female bool
}

func (d *dog) rename(name string) {
    d.name = name
    return
}

func (d *dog) print() {
    gender := "female"
    if d.female {
        gender = "male"
    }
    fmt.Printf("Dog %s is a %s and %s \n", d.name, d.race, gender)
}

func main() {
    fido := dog {"Fido", "Poodle", false }
    fido.rename("Cocotte")
    fido.print()
}