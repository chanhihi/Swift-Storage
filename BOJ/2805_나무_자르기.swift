//
//  2805_나무_자르기.swift
//  
//
//  Created by Chan on 2022/06/15.
//
//	https://www.acmicpc.net/problem/2805

// MARK: - 이진탐색 주의 해야할 점. sort로 조져서 break 걸면 더 빨라짐 시간 복잡도 또한 고려.

//let N = readLine()!.split(separator: " ").map { Int(String($0))!}
//var arrayM = readLine()!.split(separator: " ").map { Int(String($0))! }
let s:[Int] = [5, 20]
let (N, M) = (s[0], s[1])
var sorTree = "4 42 40 26 46".split(separator: " ").map { Int(String($0))! }

var low = 0
var high = sorTree.max()!
var sum = 0
var saw = 0

while (low <= high) {
	let mid = (low + high) / 2
	sum = 0
	for tree in sorTree {
		if mid < tree { sum += (tree - mid) }
	}
	if sum >= M {
		low = mid + 1
		saw = mid
	} else {
		high = mid - 1
	}
}

print(saw)
