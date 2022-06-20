//
//  2525_오븐_시계.swift
//  
//
//  Created by Chan on 2022/06/21.
//
//	https://www.acmicpc.net/submit/2525/44778401

var h = readLine()!.split(separator: " ").map{ Int($0)! }
var n = Int(readLine()!)!

h[1] += n
while (h[1] > 59) {
	h[0] += 1
	h[1] -= 60
}
while (h[0] > 23) {
	h[0] -= 24
}

print(h[0], h[1])
