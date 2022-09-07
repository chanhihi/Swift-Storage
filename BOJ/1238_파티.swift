//
//  1238_파티.swift
//  swift_practise
//
//  Created by Chan on 2022/09/07.
//
//	https://www.acmicpc.net/problem/1238

//	MARK: - graph / djikstra / 그래프 / 다익스트라 / 개선된 다익스트라 / 우선순위 큐

import Foundation

struct PriorityQueue<T> {
	var nodes = [T]()
	let sort: (T, T) -> Bool
	
	init(sort: @escaping (T, T) -> Bool) {
		self.sort = sort
	}
	
	var isEmpty: Bool {
		return nodes.isEmpty
	}
	var count: Int {
		return nodes.count
	}
	func peek() -> T? {
		return nodes.first
	}
	func leftChildIndex(ofParentAt index: Int) -> Int {
		return 2 * index + 1
	}
	func rightChildIndex(ofParentAt index: Int) -> Int {
	return 2 * index + 2
	}
	func parentIndex(ofChildAt index: Int) -> Int {
		return (index - 1) / 2
	}
	mutating func pop() -> T? {
		guard !isEmpty else {return nil}
		nodes.swapAt(0, count-1)
		defer {
			shiftDown(from: 0)
		}
		return nodes.removeLast()
	}
	
	mutating func shiftDown(from index: Int) {
		var parent = index
		while true {
			let left = leftChildIndex(ofParentAt: parent)
			let right = rightChildIndex(ofParentAt: parent)
			var candidate = parent
			
			if left < count && sort(nodes[left], nodes[candidate]) {
				candidate = left
			}
			if right < count && sort(nodes[right], nodes[candidate]) {
				candidate = right
			}
			if candidate == parent {
				return
			}
			nodes.swapAt(parent, candidate)
			parent = candidate
		}
	}
	
	mutating func push(_ elemnet: T) {
		nodes.append(elemnet)
		
	}
	mutating func shiftUp(from index: Int) {
		var child = index
		var parent = parentIndex(ofChildAt: child)
		while child > 0 && sort(nodes[child], nodes[parent]) {
			nodes.swapAt(child, parent)
			child = parent
			parent = parentIndex(ofChildAt: child)
		}
	}
}

let INF = Int.max
let l = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (N, M, X) = (l[0], l[1], l[2])
var nodes = Array(repeating: [(Int, Int)](), count: N+1)
for _ in 0..<M {
	let i = readLine()!.split{$0==" "}.map{Int(String($0))!}
	let (start, end, cost) = (i[0], i[1], i[2])
	nodes[start].append((cost, end))
}

func Dijkstra(start: Int) -> [Int] {
	var distances = Array(repeating: INF, count: N+1)
	distances[start] = 0
	var pq = PriorityQueue<(Int, Int)>(sort: {$0.0 < $1.0})
	pq.push((0, start))
	
	while !pq.isEmpty {
		guard let curData = pq.pop() else {break}
		let curCost = curData.0
		let curNode = curData.1
		
		if distances[curNode] < curCost {
			continue
		}
		
		for nextData in nodes[curNode] {
			let nextCost = nextData.0
			let nextNode = nextData.1
			
			let totalCost = curCost + nextCost
			
			if distances[nextNode] > totalCost {
				distances[nextNode] = totalCost
				pq.push((totalCost, nextNode))
			}
		}
	}
	return distances
}

let dist1 = dijkstra(start: 1)
let dist2 = dijkstra(start: v1)
let dist3 = dijkstra(start: v2)

let first = dist1[v1] + dist2[v2] + dist3[n]
let second = dist1[v2] + dist3[v1] + dist2[n]

let ans = min(first,second)

print(ans >= 999999999 ? -1 : ans)
