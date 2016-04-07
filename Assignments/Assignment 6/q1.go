package main

import "fmt"

type roomSz struct {
    width float32
    height float32
}

type House struct {
    name string
    rooms []string
    sizeFt []roomSz
}

type Semi struct {
    house House
}

type Home interface {
    inputSqft()
    printMetric()
}

func NewHouse() *House {
    return NewHouseRooms([]string{})
}

func NewHouseRooms(rooms []string) *House {
    return &House{"House", append([]string{"kitchen", "living", "dining", "main"}, rooms...), make([]roomSz, 4 + len(rooms))}
}

func NewSemi() *Semi {
    return NewSemiRooms([]string{})
}

func NewSemiRooms(rooms []string) *Semi {
    h := NewHouseRooms(rooms)
    h.name = "semi"
    return &Semi{*h}
}

func (h *House) inputSqft() {
    fmt.Printf("%s\n", h.name)
    for i := range h.rooms {
        fmt.Printf("%s : width x length: ", h.rooms[i])
        fmt.Scanf("%fx%f", &h.sizeFt[i].width, &h.sizeFt[i].height)
    } 
}

func (h *House) printMetric() {
    fmt.Printf("%s\n", h.name)
    for i := range h.rooms {
        fmt.Printf("%s : %f x %f m \n", h.rooms[i], (h.sizeFt[i].width/3.2808), (h.sizeFt[i].height/3.2808))
    }
}

func (s *Semi) inputSqft() {
    s.house.inputSqft()
}

func (s *Semi) printMetric() {
    s.house.printMetric()
}

func main() {
    homes := []Home{NewHouse(), NewSemi(), NewHouseRooms([]string{"bedroom1", "bedroom2"})}
    for _,home := range homes {
        home.inputSqft()
    }
    for _,home := range homes {
        home.printMetric()
    }
}