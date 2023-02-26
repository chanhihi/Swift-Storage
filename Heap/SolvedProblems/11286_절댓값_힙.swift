//
//  11286_절댓값_힙.swift
//  swift_practise
//
//  Created by Chan on 2023/02/21.
//
//	https://www.acmicpc.net/problem/11286
//
//	MARK: - 절대 값 힙, 최소 힙

class Heap<T> {
	var nodes: [T] = []
	let compare: (T,T) -> Bool
	
	init(sort: @escaping (T,T) -> Bool) {
		self.compare = sort
	}
	
	var isEmpty: Bool {
		nodes.isEmpty
	}
	
	func insert(_ element: T) {
		var idx = nodes.count
		nodes.append(element)
		
		while idx > 0, compare(nodes[idx], nodes[(idx-1)/2]) {
			nodes.swapAt(idx, (idx-1)/2)
			idx = (idx-1)/2
		}
	}
	
	func pop() -> T? {
		guard nodes.isEmpty == false else {
			return nil
		}
		
		if nodes.count == 1 {
			return nodes.removeLast()
		}
		
		let target = nodes.first
		nodes.swapAt(0, nodes.count - 1)
		_ = nodes.popLast()
		
		var idx = 0
		let limit = nodes.count
		
		while idx < limit {
			let leftChild = idx * 2 + 1
			let rightChild = leftChild + 1
			
			let children = [leftChild, rightChild]
					.filter{$0 < limit && compare(nodes[$0], nodes[idx])}
					.sorted {compare(nodes[$0], nodes[$1])}
								
			if children.isEmpty { break }
			
			nodes.swapAt(idx, children[0])
			idx = children[0]
		}
		
		return target
	}
}

let heap = Heap<Int> {
	if abs($0) < abs($1) { return true }
	else if abs($0) == abs($1) { return $0 < $1 }
	else { return false }
}

for _ in 0..<Int(readLine()!)! {
	let r = Int(readLine()!)!
	if r == 0 {
		let p = heap.pop()
		if p == nil { print(0) }
		else { print(p!) }
	}
	else { heap.insert(r) }
}
