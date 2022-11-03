//
//  2667_단지번호붙이기.swift
//  swift_practise
//
//  Created by Chan on 2022/11/02.
//
//	https://www.acmicpc.net/problem/2667

//	MARK: - bfs

let N = Int(readLine()!)!
var board = [[Int]]()
for _ in 0..<N {
	board.append(readLine()!.map{Int(String($0))!})
}

var house = [Int]()
let dx = [1, 0, 0, -1]
let dy = [0, 1, -1, 0]

func bfs(_ r: Int, _ c: Int) -> Int{
	var queue = [(r, c)]
	var index = 0
	var count = 1
	board[r][c] = 0
	
	while queue.count > index {
		let (x, y) = queue[index]
		index += 1
		
		for i in 0..<4 {
			let (nx, ny) = (x+dx[i], y+dy[i])
			if (0..<N).contains(nx) && (0..<N).contains(ny) && board[nx][ny] == 1 {
				board[nx][ny] = 0
				count += 1
				queue.append((nx, ny))
			}
		}
	}
	return count
}

for i in 0..<N{
	for j in 0..<N{
		if board[i][j] == 1 {
			house.append(bfs(i, j))
		}
	}
}
print(house.count)
for n in house.sorted(by: <) {
	print(n)
}
