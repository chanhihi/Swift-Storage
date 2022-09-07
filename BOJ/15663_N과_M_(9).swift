//
//  15663_N과_M_(9).swift
//  swift_practise
//
//  Created by Chan on 2022/09/05.
//
//	https://www.acmicpc.net/problem/15663

//	MARK: - 재귀 / visit / 그래프

let l = readLine()!.split{$0==" "}.map {Int(String($0))!}
let arr = readLine()!.split{$0==" "}.map {Int(String($0))!}.sorted()
let (N, M) = (l[0], l[1])
var result = [Int]()
var r = ""
var visited = Array(repeating: false, count: 8)

func visit(depth: Int) {
	var beforeNum = 0
	
	if depth == M {
		r += (result.map{String($0)}.joined(separator :" ") + "\n")
		return
	}
	for i in 0..<arr.count {
		if !visited[i] && beforeNum != arr[i] {
			visited[i] = true
			result.append(arr[i])
			beforeNum = arr[i]
			visit(depth: depth + 1)
			result.removeLast()
			visited[i] = false
		}
	}
}

visit(depth: 0)
print(r)
