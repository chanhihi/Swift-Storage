//
//  18111_마인크래프트.swift
//  swift_practise
//
//  Created by Chan on 2023/03/15.
//
//	https://www.acmicpc.net/problem/18111
//
//	MARK: - brute force / simulation

let n = readLine()!.split(separator: " ").map{Int(String($0))!}
var (N,M,B) = (n[0], n[1], n[2])
var height = 0
var min_time = Int.max
var arr = [[Int]]()

for _ in 0..<N { arr.append(readLine()!.split(separator: " ").map{Int(String($0))!}) }

for k in 0...256 {
	var b = 0, rm = 0
	
	for i in 0..<N {
		for j in 0..<M {
			let cH = arr[i][j] - k
			if (cH < 0) {b -= cH}
			else {rm += cH}
		}
	}
	if rm + B >= b {
		let t = 2 * rm + b
		if (min_time >= t) {
			min_time = t
			height = k
		}
	}
}
print(min_time, height)
