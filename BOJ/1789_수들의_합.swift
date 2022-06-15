//
//  1789_수들의_합.swift
//  
//
//  Created by Chan on 2022/06/15.
//
//	https://www.acmicpc.net/problem/1789

// MARK: - 반복문 사용 풀이

import Foundation
//let line = readLine()
let input = 200
var count = 1
var sum = 0

while (true) {
	sum += count
	if (sum > input) { break }
	else { count += 1 }
}
print(count-1)

// MARK: - 재귀 사용 풀이
var countt = 1
func recursive (_ n: Int, _ result: Int){
	var result = result
	if result < 0 {
		countt = countt - 2
		return
	}
	result -= countt
	countt += 1
	recursive(n + countt, result)
}

recursive(1, input)
print(countt)

