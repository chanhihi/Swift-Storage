//
//  1916_최소비용_구하기.swift
//  swift_practise
//
//  Created by Chan on 2022/06/30.
//
//	https://www.acmicpc.net/problem/1916

//	MARK: - 기본적인 다익스트라 구현
let cityCount = Int(readLine()!)!	// 도시갯수 (1~1000)
var queue = [[(end: Int, value: Int)]](repeating: [], count: cityCount+1) // start 값을 배열의 넘버로 가지는 end, value의 배열(튜플 사용 위해 end, value)
let n = Int(readLine()!)!	// 간선 갯수
for _ in 0..<n {
	let cursor = readLine()!.split(separator: " ").map{Int($0)!}	// 간선 정보저장
	queue[cursor[0]].append((cursor[1],cursor[2]))	// start 배열에 end,value저장
}
let track = readLine()!.split(separator: " ").map{Int(String($0))!}	// 시작지,목적지
let (start, finish) = (track[0], track[1])
var visited = [Bool](repeating: false, count: cityCount+1)	// 방문했는지 확인
visited[0] = true
var graph = [Int](repeating: Int.max, count: cityCount+1)	// 최단 경로를 표시하는 distance 배열
graph[start] = 0
visit(start)		// 방문 시작(start 부터)
func visit(_ current: Int) {
	guard current != finish else { return }
	visited[current] = true
	for (end, value) in queue[current] {
		graph[end] = min(graph[end], graph[current] + value)	// 거쳐갈때 가장 작은수 찾는 부분
	}
	let next = graph.enumerated().filter({!visited[$0.offset]}).min(by: {$0.element < $1.element})!.offset	// 그래프 visit false중 가장 수의 인덱스
	visit(next)
}
print(graph[finish])
