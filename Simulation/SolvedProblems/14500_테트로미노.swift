//
//  14500_테트로미노.swift
//  swift_practise
//
//  Created by Chan on 2023/02/24.
//
//	https://www.acmicpc.net/problem/14500
//
//	MARK: - dfs / simulation / bruteforce

typealias Coord = (x: Int, y: Int)
var l = readLine()!.split(separator: " ").map{Int(String($0))!}
var (n, m) = (l[0], l[1])
var map = [[Int]]()
var mapCheck = Array(repeating: Array(repeating: false, count: m), count: n)
var maximumCount = 0
var d: [Coord] = [(-1, 0), (0, 1), (1, 0), (0, -1)]
let coordinationT: [[Coord]] = [
	[(0,0),(-1,0),(1,0),(0,1)], // ㅜ
	[(0,0),(-1,0),(1,0),(0,-1)], // ㅗ
	[(0,0),(-1,0),(0,-1),(0,1)], // ㅓ
	[(0,0),(0,-1),(1,0),(0,1)] // ㅏ
]

func dfs(x: Int, y: Int, sum: Int, depth: Int) {
	if depth == 4 {
		maximumCount = max(maximumCount, sum)
		return
	}
	
	for i in 0..<4 {
		let nx = x + d[i].x
		let ny = y + d[i].y
		
		guard 0 <= nx && nx < n && 0 <= ny && ny < m else { continue }
		
		if mapCheck[nx][ny] == false {
			mapCheck[nx][ny] = true
			dfs(x: nx, y: ny, sum: sum + map[nx][ny], depth: depth + 1)
			mapCheck[nx][ny] = false
		}
	}
}

func tetrominoT(x: Int, y: Int) {
	for i in 0..<4 {
		var sum = 0
		var isComplete = true
		for j in 0..<4 {
			let nx = x + coordinationT[i][j].x
			let ny = y + coordinationT[i][j].y
			
			guard 0 <= nx && nx < n && 0 <= ny && ny < m else {
				isComplete = false
				break
			}
			sum += map[nx][ny]
		}
		if isComplete == true {
			maximumCount = max(maximumCount, sum)
		}
	}
}

for _ in 0..<n {
	map.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

for i in 0..<n {
	for j in 0..<m {
		mapCheck[i][j] = true
		dfs(x: i, y: j, sum: 0, depth: 0)
		mapCheck[i][j] = false
		tetrominoT(x: i, y: j)
	}
}

print(maximumCount)

