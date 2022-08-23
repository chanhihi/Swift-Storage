//
//  1389_케빈_베이컨의_6단계_법칙.swift
//  swift_practise
//
//  Created by Chan on 2022/08/23.
//

//https://www.acmicpc.net/problem/1389

// MARK: - 인접리스트 / bfs

struct Queue<T> {
	var queue = [T]()
	var index = 0
	
	var isEmpty: Bool {
		return queue.count - index == 0
	}
	
	mutating func push(_ e: T) {
		queue.append(e)
	}
	
	mutating func pop() -> T {
		defer {
			index += 1
		}
		return queue[index]
	}
}

let r = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (N, M) = (r[0], r[1])

var matrix = Array(repeating: Array(repeating: false, count: N + 1), count: N + 1)
for _ in 0..<M {
	let edge = readLine()!.split{$0==" "}.map{Int(String($0))!}
	matrix[edge[0]][edge[1]] = true
	matrix[edge[1]][edge[0]] = true
}

func bfs(n: Int) -> Int {
	var queue = Queue<(Int, Int)>()
	var visited = Array(repeating: false, count: N + 1)
	var cnt = 0
	queue.push((n,0))
	visited[n] = true

	while !queue.isEmpty{
		let now = queue.pop()
		cnt += now.1
		for i in 1..<(N + 1){
			if matrix[now.0][i] && !visited[i]{
				queue.push((i, now.1+1))
				visited[i] = true
			}
		}
	}
	return cnt
}
var result = Array(repeating: Int.max, count: N + 1)
for i in 1..<(N + 1){
	result[i] = bfs(n: i)
}
print(result.firstIndex(of: result.min()!)!)
