//
//  6186_Best Grass.swift
//  swift_practise
//
//  Created by Chan on 2023/02/27.
//
//	https://www.acmicpc.net/problem/6186
//
//	MARK: - BFS / DFS

typealias Coord = (r: Int, c: Int)

let d: [Coord] = [(-1, 0), (1, 0), (0, -1), (0, 1)]
let rc = readLine()!.split(separator: " ").map{Int(String($0))!}
let (R, C) = (rc[0], rc[1])
var count = 0
var map = [[String]]()
var vMap = Array(repeating: Array(repeating: false, count: C), count: R)
var q = Queue<(r: Int, c: Int)>()

for _ in 0..<R { map.append(readLine()!.map{String($0)}) }

func BFS(_ r: Int, _ c: Int) {
	vMap[r][c] = true
	while !q.isEmpty {
		guard let dq = q.dequeue() else { continue }
		
		for i in 0..<4 {
			let nr = dq.r + d[i].r
			let nc = dq.c + d[i].c
			if nr >= 0 && nr < R && nc >= 0 && nc < C {
				if map[nr][nc] == "#" && vMap[nr][nc] == false {
					q.enqueue((nr, nc))
					vMap[nr][nc] = true
				}
			}
		}
	}
}

for i in 0..<R {
	for j in 0..<C {
		if map[i][j] == "#" && vMap[i][j] == false {
			count += 1
			q.enqueue((i, j))
			BFS(i, j)
		}
	}
}

print(count)
