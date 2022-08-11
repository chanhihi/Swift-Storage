//
//  2606_바이러스.swift
//  swift_practise
//
//  Created by Chan on 2022/08/10.
//
//	https://www.acmicpc.net/problem/2606
//
//	MARK: - 그래프 기본 / dic 구현

var N = Int(readLine()!)!
var E = Int(readLine()!)!

var graph = [Int:[Int]]()
var visited = [Int]()

for i in 1...N {
	graph[i] = [Int]()
}

for _ in 0..<E{
	var n = readLine()!.split(separator: " ").map{Int(String($0))!}
	graph[n[0]]?.append(n[1])
	graph[n[1]]?.append(n[0])
}

func dfs(_ node:Int){
	if visited.contains(node){return}
	
	visited.append(node)
	for node in graph[node]! {
		dfs(node)
	}
}
dfs(1)

print(visited.count - 1)
