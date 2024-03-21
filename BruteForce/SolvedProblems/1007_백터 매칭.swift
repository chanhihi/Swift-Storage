//
//  1007_벡터 매칭.swift
//  swift_practise
//
//  Created by Chan on 2023/03/15.
//
//	https://www.acmicpc.net/problem/1007
//
//	MARK: - brute force / math

/* note:
 * 전체 합을 구해놓은 뒤
 */

import Foundation

typealias Coord = (x: Double, y: Double)

let N = Int(readLine()!)!

for _ in 0..<N { solution(Int(readLine()!)!) }

func solution(_ n: Int) {
	var P: [(Int, Int)] = []
	var result = Double(Int.max)
	var pointSum = (0, 0)
	for _ in 0..<n {
		let value = readLine()!.split(separator: " ").map { Int(String($0))! }
		pointSum.0 += value[0]
		pointSum.1 += value[1]
		
		P.append((value[0], value[1]))
		print((value[0], value[1]), pointSum)
	}

	for i in 0..<n { visit([i]) }

	print(result)

	func visit(_ indices: [Int]) {
		if indices.count == n / 2 {
			var minusSum = (0, 0)
			indices.forEach { index in
				minusSum.0 -= P[index].0
				minusSum.1 -= P[index].1
			}
			let x = Double(pointSum.0 + (minusSum.0 * 2)) * Double(pointSum.0 + (minusSum.0 * 2))
			let y = Double(pointSum.1 + (minusSum.1 * 2)) * Double(pointSum.1 + (minusSum.1 * 2))
			let sqrt = sqrt(x + y)
			result = result > sqrt ? sqrt : result
		} else {
			if indices.last! + 1 < n {
				for i in indices.last! + 1..<n {
					visit(indices + [i])
				}
			}
		}
	}
}


// MARK: - simd2의 distance 구하는 값을 이용해서 풀어보려 했던 식. (음수값 표현이 안되서 못풂)

func _solution(_ n: Int) {
	var result: Double = Double(Int.max)
	var P = [[Double]]()
	var simd_p = [SIMD2<Double>]()
	for _ in 0..<n { P.append(readLine()!.split(separator: " ").map{Double(String($0))!}) }

	P.forEach{
		simd_p.append(SIMD2($0[0], $0[1]))
	}

	for i in 0..<simd_p.count-1 {
		for j in i+1..<simd_p.count
		{
			print(simd_p[i], simd_p[j], i, j,">>>", distance(simd_p[i], simd_p[j]))
			result = distance(simd_p[i], simd_p[j])
		}
	}

	print(result)
}
