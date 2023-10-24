//
//  2263_트리의 순회.swift
//  swift_practise
//
//  Created by Chan on 2023/03/15.
//
//	https://www.acmicpc.net/problem/2263
//
//	MARK: - divide & conquer

/* note:
 * 루트를 찾기. 그려서 확인한번 해보기.
 */

let n = Int(readLine()!)!
let inOrder = readLine()!.split(separator: " ").map{Int(String($0))!}
let postOrder = readLine()!.split(separator: " ").map{Int(String($0))!}
var result = ""
var inOrderValueToIndex: [Int:Int] = [:]
var visited = Array(repeating: false, count: n)

for i in 0..<n { inOrderValueToIndex[inOrder[i]] = i }

visit(0, n-1, 0, n-1)

print(result)

func visit(_ infrom: Int, _ inthrough: Int, _ postfrom: Int, _ postthrough: Int) {
	if infrom > inthrough || postfrom > postthrough {
		return
	}
	result += "\(postOrder[postthrough]) "
	let next = inOrderValueToIndex[postOrder[postthrough]]!
	visit(infrom, next - 1, postfrom, postfrom + next - infrom - 1)
	visit(next + 1, inthrough, postfrom + next - infrom, postthrough - 1)
}
