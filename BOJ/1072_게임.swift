//
//  1072_게임.swift
//  swift_practise
//
//  Created by Chan on 2022/10/24.
//

//	MARK: - 이분탐색

let l = readLine()!.split(separator: " ").map{Int(String($0))!}
let (x, y) = (l[0], l[1])
let z = y * 100 / x
var result = -1
var left = 1
var right = 1_000_000_000

while left <= right {
	let mid = (left + right) / 2
		
	let nx = x + mid
	let ny = y + mid
	let nz = ny * 100 / nx
	
	if z != nz {
		right = mid - 1
		result = mid
	} else {
		left = mid + 1
	}
}

print(result)
