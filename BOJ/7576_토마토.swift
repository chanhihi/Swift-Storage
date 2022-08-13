import Foundation

let n = readLine()!.split(separator: " ").map({Int(String($0))!}) // 상자 크기
let (M, N) = (n[0], n[1])
var storage = [[Int]]()
var queue = [(Int, Int)]()
let dx = [-1, 1, 0 , 0]
let dy = [0, 0, -1, 1]
var empty = 0
var count = 0

for _ in 0..<N {
	storage.append(readLine()!.split(separator: " ").map({Int(String($0))!}))
}

func bfs() {
	var index = 0
	while index < queue.count {
		let (x, y) = queue[index]
		index += 1
		
		for i in 0..<4 {
			let nx = x + dx[i]
			let ny = y + dy[i]
			
			if nx < 0 || ny < 0 || nx >= N || ny >= M { continue } // 예외
			
			if storage[nx][ny] == 0 {
				queue.append((nx, ny))
				storage[nx][ny] = storage[x][y] + 1
				count += 1
			}
		}
	}
}

for x in 0..<N {
	for y in 0..<M {
		if storage[x][y] == 1 { queue.append((x, y)) }
		else if storage[x][y] == 0 { empty += 1 }
	}
}

bfs()

empty == 0 ? print(0) : (empty == count ? print(storage.flatMap({$0}).max()!-1) : print(-1))
