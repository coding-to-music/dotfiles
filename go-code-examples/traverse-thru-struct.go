//
// https://stackoverflow.com/questions/19439430/go-golang-traverse-through-struct/19439503
//
package main

import "fmt"

type TrainData struct {
	sentence  string
	sentiment string
	weight    int
}

var TrainDataCity = []TrainData{
	{"I love the weather here.", "pos", 1700},
	{"This is an amazing place!", "pos", 2000},
	{"I feel very good about its food and atmosphere.", "pos", 2000},
	{"The location is very accessible.", "pos", 1500},
	{"One of the best cities I've ever been.", "pos", 2000},
	{"Definitely want to visit again.", "pos", 2000},
	{"I do not like this area.", "neg", 500},
	{"I am tired of this city.", "neg", 700},
	{"I can't deal with this town anymore.", "neg", 300},
	{"The weather is terrible.", "neg", 300},
	{"I hate this city.", "neg", 100},
	{"I won't come back!", "neg", 200},
}

func GetTotalWeight(data_arr []TrainData) int {
	total := 0
	for _, elem := range data_arr {
		total += elem.weight
	}
	return total
}

func main() {
	fmt.Println("Hello, playground")
	fmt.Println(GetTotalWeight(TrainDataCity))
}
