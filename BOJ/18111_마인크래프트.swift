//
//  18111_마인크래프트.swift
//  swift_practise
//
//  Created by Chan on 2022/07/15.
//
//	https://www.acmicpc.net/problem/18111
//

let n = readLine()!.split(separator: " ").map{Int(String($0))!}
var (N,M,B) = (n[0], n[1], n[2])
var height = 0
var min_time = Int.max
var arr = [[Int]]()

for _ in 0..<N {
	arr.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

for k in 0...256 {
	var b = 0
	var rm = 0
	
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

//	MARK: - 완전탐색 풀이 > 함수 사용 구현 > 시간초과. > swift ..
//import Foundation
//
//let n = readLine()!.split(separator: " ").map{Int(String($0))!}
//var (N,M,B) = (n[0], n[1], n[2])
//var height = 0
//var min_time = Int.max
//var time_count = 0
//var arr = [[Int]]()
//var arr_min = Int.max
//var arr_max = Int.min
//
//for _ in 0..<N {
//	let a = readLine()!.split(separator: " ").map{Int(String($0))!}
//	arr_min = min(a.min()!, arr_min)
//	arr_max = max(a.max()!, arr_max)
//	arr.append(a)
//}
//
//func dig_block (_ i:Int, _ j:Int, _ arr: inout [[Int]], _ b:inout Int) {
//	arr[i][j] -= 1
//	time_count += 2
//	b += 1
//}
//
//func put_block (_ i:Int, _ j:Int, _ arr: inout [[Int]], _ b:inout Int) {
//	arr[i][j] += 1
//	time_count += 1
//	b -= 1
//}
//
//for k in arr_min...arr_max {
//	var temp_arr = arr
//	var temp_B = B
//	for i in 0..<N {
//		for j in 0..<M {
//			if temp_B < 0 {break}
//			while temp_arr[i][j] > k {
//				dig_block(i, j, &temp_arr, &temp_B)
//				if min_time < time_count {
//					break
//				}
//			}
//			while temp_arr[i][j] < k {
//				put_block(i, j, &temp_arr, &temp_B)
//				if min_time < time_count {
//					break
//				}
//			}
//			if min_time < time_count {
//				break
//			}
//		}
//		if min_time < time_count {
//			break
//		}
//		if temp_B < 0 {break}
//	}
//	if min_time > time_count && temp_B >= 0 {
//		min_time = time_count
//		height = k
//	}
//	time_count = 0
//}
//
//print(min_time, height)
