//
//  2512_예산.swift
//  swift_practise
//
//  Created by Chan on 2022/10/26.
//
//

//	MARK: - 이분탐색

let N = Int(readLine()!)!
let n = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted()
let M = Int(readLine()!)!
var result = 0

var left = 0
var right = n.max()!
var mid = (left + right) / 2

func isPossible(_ m: Int) -> Bool {
	var sum = 0
	for i in n {
		sum += min(i, m)
	}
	return sum <= M
}

while left <= right {
	if isPossible(mid) {
		left = mid + 1
		result = mid
	} else {
		right = mid - 1
	}
	mid = (left + right) / 2
}

print(result)
