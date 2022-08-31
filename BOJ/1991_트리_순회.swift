//
//  1991_트리_순회.swift
//  swift_practise
//
//  Created by Chan on 2022/09/01.
//
//	https://www.acmicpc.net/problem/1991

//	MARK: - 트리 순회 기본 / 전위 / 중위 / 후위 순회

let count = Int(readLine()!)!
var result = ["", "", ""]
var tree = [String:[String]]()

for _ in 0..<count {
	let l = readLine()!.split(separator: " ").map{String($0)}
	tree[l[0]] = [l[1], l[2]]
}
print(tree)
func dfs(_ node: String) {
	if node == "." {return}
	result[0] += node
	dfs(tree[node]![0])
	result[1] += node
	dfs(tree[node]![1])
	result[2] += node
}

dfs("A")

for r in result {
	print(r)
}
