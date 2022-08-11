//
//  11724_연결_요소의_개수.swift
//  swift_practise
//
//  Created by Chan on 2022/08/11.
//
//	https://www.acmicpc.net/problem/11724

//	MARK: - 그래프 기본

let r = readLine()!.split(separator: " ").map{Int(String($0))!}
let (node, edge) = (r[0], r[1])
var graph = Array(repeating: [], count: node+1)
var visited = Array(repeating: false, count: node+1)
var result = 0
var depth = 0

for _ in 0..<edge{
	let n = readLine()!.split(separator: " ").map{Int(String($0))!}
	graph[n[0]].append(n[1])
	graph[n[1]].append(n[0])
}

func dfs(_ start:Int,_ depth:Int){
	visited[start] = true
	for i in 0..<graph[start].count{
		let next = graph[start][i] as! Int
		if visited[next] == false {
			dfs(next, depth+1)
		}
	}
}

for i in 1..<node+1 {
	if !visited[i] {
		if graph[i].isEmpty {
			result += 1
			visited[i] = true
		} else {
			dfs(i, 0)
			result += 1
		}
	}
}

print(result)
