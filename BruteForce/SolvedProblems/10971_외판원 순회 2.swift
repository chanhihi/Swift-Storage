//
//  10971_외판원 순회.swift
//  swift_practise
//
//  Created by Chan on 2023/03/09.
//
//	https://www.acmicpc.net/problem/10971
//
//	MARK: - BruteForce / DFS / BackTracking

/* note:
 * 간단한 dfs문제. 문제를 잘 읽어서 이해를 해야 쉽게 풀 수 있다.
 * now == start 조건을 주지 않아서 틀렸던 문제.
 */

import Foundation

let N = Int(readLine()!)!
var m = [[Int]]()
var c = Array(repeating: false, count: N)
var result = Int.max

for _ in 0..<N { m.append(readLine()!.split(separator: " ").map{Int(String($0))!}) }

func dfs(_ depth: Int, _ cost: Int, _ now: Int, _ start: Int) {
	if depth == N && now == start {
		result = min(result, cost)
		return
	}
	for i in 0..<N {
		if !c[i] && m[now][i] > 0 {
			c[i] = true
			if cost <= result {
				dfs(depth + 1, cost + m[now][i], i, start)
			}
			c[i] = false
		}
	}
}

dfs(0, 0, 0, 0)

print(result)
