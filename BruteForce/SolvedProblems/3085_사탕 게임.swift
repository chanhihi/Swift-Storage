//
//  3085_사탕 게임.swift
//  swift_practise
//
//  Created by Chan on 2023/03/09.
//
//	https://www.acmicpc.net/problem/3085
//
//	MARK: - simulation / BruteForce

/* note:
 * 간단한 BF 문제
 * 논리적으로 그냥 다해보면 풀림.
 */

import Foundation

typealias Coord = (x: Int, y: Int)
let N = Int(readLine()!)!
var m = [[String]]()
var d: [Coord] = [(1, 0), (0, 1)]
var count = 0

for _ in 0..<N { m.append(readLine()!.map{String($0)}) }

for i in 0..<N {
	for j in 0..<N {
		if (0..<N).contains(j + d[0].x) {
			m[i].swapAt(j, j + d[0].x)
			check(m)
			m[i].swapAt(j, j + d[0].x)
		}
		
		if (0..<N).contains(j + d[1].y) {
			var temp = m[j][i]
			m[j][i] = m[j + d[1].y][i]
			m[j + d[1].y][i] = temp
			check(m)
			temp = m[j][i]
			m[j][i] = m[j + d[1].y][i]
			m[j + d[1].y][i] = temp
		}
	}
}


func check(_ mapp: [[String]]) {
	for i in 0..<N {
		var prev = ""
		var tempCount = 1
		for j in 0..<N {
			if mapp[i][j] == prev { tempCount += 1 }
			else { tempCount = 1 }
			prev = mapp[i][j]
			count = max(count, tempCount)
			if count == N {
				print(count)
				exit(0)
			}
		}
	}
	
	for i in 0..<N {
		var prev = ""
		var tempCount = 1
		for j in 0..<N {
			if mapp[j][i] == prev { tempCount += 1 }
			else { tempCount = 1 }
			prev = mapp[j][i]
			count = max(count, tempCount)
			if count == N {
				print(count)
				exit(0)
			}
		}
	}
}
print(count)
