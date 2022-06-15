//
//  10815_숫자_카드.swift
//  
//
//  Created by Chan on 2022/06/15.
//
//	https://www.acmicpc.net/problem/10815

// MARK: - 이분탐색시 조심해야 할 것 -> 인덱싱 범위초과

//let N = Int(readLine()!)!
//var sorN = readLine()!.split(separator: " ").map { Int(String($0))}.sorted()
//let M = Int(readLine()!)!
//var arrayM = readLine()!.split(separator: " ").map { Int(String($0))}

let N = 5
var sorN = "6 3 2 10 -10".split(separator: " ").map { Int(String($0))!}.sorted()
let M = 8
var arrayM = "10 9 -5 2 3 4 5 -10".split(separator: " ").map { Int(String($0))!}
var result: [String] = Array(repeating: "0", count: M)

for (index, value) in arrayM.enumerated() {
	var low = 0
	var high = N - 1

	while (low <= high) {
		let mid = (low + high) / 2
		
		if value == sorN[mid] {
			result[index] = "1"
		}
		
		if (value > sorN[mid]) {
			low = mid + 1
		} else {
			high = mid - 1
		}
	}
}

print(result.joined(separator: " "))
