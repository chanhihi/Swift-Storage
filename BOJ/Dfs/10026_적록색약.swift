//
//  10026_적록색약.swift
//  swift_practise
//
//  Created by Chan on 2023/02/12.
//
//	https://www.acmicpc.net/problem/10026
//
//	MARK: - DFS

import Foundation

var map = [String]()
var mapG = map
let n = Int(readLine()!)!
var mapCheck = Array(repeating: Array(repeating: false, count: n), count: n)
var mapGCheck = mapCheck

for _ in 0..<n {
	map.append(readLine()!)
}

map.forEach{mapG.append($0.replacingOccurrences(of: "R", with: "G"))}

var dx = [1, 0, 0, -1]
var dy = [0, 1, -1, 0]
var count = 0
var countG = 0

func dfs(_ m : [String], _ x: Int, _ y: Int) {
	if mapCheck[x][y] == true { return }
	mapCheck[x][y] = true
	for i in 0...3 {
		let px = x + dx[i]
		let py = y + dy[i]
		if px < 0 || py < 0 || px >= n || py >= n { continue }
		if m[x][y] == m[px][py] {
			dfs(m, px, py)
		}
	}
}

func dfsG(_ m : [String], _ x: Int, _ y: Int) {
	if mapGCheck[x][y] == true { return }
	mapGCheck[x][y] = true
	for i in 0...3 {
		if x + dx[i] < 0 || y + dy[i] < 0 || x + dx[i] >= n || y + dy[i] >= n { continue }
		if m[x][y] == m[x + dx[i]][y + dy[i]] {
			dfsG(m, x + dx[i], y + dy[i])
		}
	}
}

for i in 0..<n{
	for j in 0..<n{
		if mapCheck[i][j] == false {
			print(mapCheck[i][j], i, j)
			dfs(map, i, j)
			count += 1
		}
		if mapGCheck[i][j] == false {
			dfsG(mapG, i, j)
			countG += 1
		}
	}
}

print("\(count) \(countG)")
