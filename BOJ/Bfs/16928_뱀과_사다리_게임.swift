//
//  16928_뱀과_사다리_게임.swift
//  swift_practise
//
//  Created by Chan on 2023/02/16.
//
//	https://www.acmicpc.net/problem/16928
//
//	MARK: - bfs

let r = readLine()!.split{$0==" "}.map{ Int(String($0))! }
let (n, m) = (r[0], r[1])

var move = [[Int]]()
for _ in 0..<n+m{
	move.append(readLine()!.split(separator: " ").map{ Int(String($0))!} )
}

func bfs() {
	var visited = Array(repeating: false, count: 101)
	var queue = [(Int, Int)]()

	queue.append((1, 0))
	visited[1] = true
	var idx = 0
	while queue.count > idx{
		let pop = queue[idx]
		idx += 1
		var curLocation = pop.0
		if curLocation == 100 { print(pop.1); break }
		for i in move{
			if i[0] == pop.0{
				curLocation = i[1]
			}
		}
		for i in 1...6{
			let move = curLocation + i
			if move > 100 || visited[move] { continue }
			queue.append((move, pop.1 + 1))
			visited[move] = true
		}
		
	}
}

bfs()
