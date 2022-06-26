//
//  lv01_직사각형_별찍기.swift
//  
//
//  Created by Chan on 2022/06/27.
//
//	https://programmers.co.kr/learn/courses/30/lessons/12969

import Foundation

let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
var (a, b) = (n[0], n[1])

while b != 0 {
	while a != 0 {
		print("*", terminator: "")
		a-=1
	}
	print("")
	a=n[0]
	b-=1
}
