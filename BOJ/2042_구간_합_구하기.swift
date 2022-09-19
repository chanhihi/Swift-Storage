//
//  2042_구간_합_구하기.swift
//  swift_practise
//
//  Created by Chan on 2022/09/19.
//
//	https://www.acmicpc.net/problem/2042
//	MARK: - segment tree / seg tree / 세그먼트 트리 / 트리

class SegmentTree<T> {
	var value: T
	var function: (T, T) -> T
	var leftBounds: Int
	var rightBounds: Int
	var leftChild: SegmentTree<T>?
	var rightChild: SegmentTree<T>?
	
	init(array: [T], leftBounds: Int, rightBounds: Int, function: @escaping (T, T) -> T) {
		self.leftBounds = leftBounds
		self.rightBounds = rightBounds
		self.function = function
		
		if leftBounds == rightBounds {
			self.value = array[leftBounds]
		} else {
			let middle = (leftBounds + rightBounds) / 2
			self.leftChild = SegmentTree<T>(
				array: array,
				leftBounds: leftBounds,
				rightBounds: middle,
				function: function
			)
			
			self.rightChild = SegmentTree<T>(
				array: array,
				leftBounds: middle+1,
				rightBounds: rightBounds,
				function: function
			)
			self.value = function(leftChild!.value, rightChild!.value)
		}
	}
	
	convenience init(array: [T], function: @escaping (T, T) -> T) {
		self.init(array: array, leftBounds: 0, rightBounds: array.count-1, function: function)
	}
	
	func query(withLeftBounds leftBounds: Int, rightBounds: Int) -> T {
		if self.leftBounds == leftBounds, self.rightBounds == rightBounds {
			return value
		}
		
		guard let leftChild = leftChild,
			  let rightChild = rightChild
		else { fatalError() }
		
		if leftChild.rightBounds < leftBounds {
			return rightChild.query(withLeftBounds: leftBounds, rightBounds: rightBounds)
		}
		
		else if rightChild.leftBounds > rightBounds {
			return leftChild.query(withLeftBounds: leftBounds, rightBounds: rightBounds)
		}
		
		else {
			let leftValue = leftChild.query(withLeftBounds: leftBounds, rightBounds: leftChild.rightBounds)
			let rightValue = rightChild.query(withLeftBounds: rightChild.leftBounds, rightBounds: rightBounds)
			return function(leftValue, rightValue)
		}
	}
	
	func replaceItem(at index: Int, withItem item: T) {
		if leftBounds == rightBounds {
			value = item
		} else if let leftChild = leftChild, let rightChild = rightChild {
			if leftChild.rightBounds >= index {
				leftChild.replaceItem(at: index, withItem: item)
			} else {
				rightChild.replaceItem(at: index, withItem: item)
			}
			value = function(leftChild.value, rightChild.value)
		}
	}
}
var Z = readLine()!.split(separator: " ").map{Int(String($0))!}
var (N, M, K) = (Z[0], Z[1], Z[2])
var a = [0]
for _ in 0..<N{
	a.append(Int(readLine()!)!)
}

let segTree = SegmentTree<Int>(array: a, function: +)
for _ in 0..<M+K{
	let l = readLine()!.split(separator: " ").map{Int(String($0))!}
	if l[0] == 1 {
		segTree.replaceItem(at: l[1], withItem: l[2])
	} else if l[0] == 2 {
		print(segTree.query(withLeftBounds: l[1], rightBounds: l[2]))
	}
}
