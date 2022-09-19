//
//  17626_Four_Squares.swift
//  swift_practise
//
//  Created by Chan on 2022/09/13.
//
//	https://www.acmicpc.net/problem/17626

import Foundation

extension Double {
	func isInt() -> Bool {
		return Double(floor(self)) == Double(self)
	}
}

func solution(_ number: Double) -> Int {
	if sqrt(number).isInt() {return 1}
	let n = Int(sqrt(number))
	for i in 0...n where sqrt(number-Double(i*i)).isInt() {return 2}
	for i in 0...n {
		for j in 0...Int(number-Double(i*i)) where sqrt(number-Double(i*i+j*j)).isInt() {return 3}
	}
	return 4
}

print(solution(Double(readLine()!)!))

