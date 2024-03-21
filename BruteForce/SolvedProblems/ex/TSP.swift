//
//  TSP.swift
//  swift_practise
//
//  Created by Chan on 2023/04/05.
//
//

/*
 * 변수명 개선
 */

import Foundation

let N = Int(readLine()!)!
var cities = [[Int]]()
var visited = Array(repeating: false, count: N)
var result = 987654321

for _ in 0..<N { cities.append(readLine()!.split(separator: " ").map{Int(String($0))!}) }

func dfs(_ depth: Int, _ cost: Int, _ now: Int, _ start: Int) {
	if depth == N && now == start {
		result = min(result, cost)
		return
	}
	for i in 0..<N {
		if !visited[i] && cities[now][i] > 0 {
			visited[i] = true
			if result > cost {
				dfs(depth + 1, cost + cities[now][i], i, start)
			}
			visited[i] = false
		}
	}
}

dfs(0, 0, 0, 0)

print(result)
