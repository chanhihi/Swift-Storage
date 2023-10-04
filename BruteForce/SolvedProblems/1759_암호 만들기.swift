//
//  1759_암호 만들기.swift
//  swift_practise
//
//  Created by Chan on 2023/05/20.
//
//	https://www.acmicpc.net/problem/1759
//
//	MARK: - bruteforce / backtracking

let lc = readLine()!.split(separator: " ").map{Int(String($0))!}
let (l, c) = (lc[0], lc[1])
var pb = readLine()!.split(separator: " ").map{String($0)}
var result: Set<String> = []

func check(_ s: [String]) -> Bool {
	var vowelCount = 0
	var consonantCount = 0
	let vowels = ["a", "e", "i", "o", "u"]

	for n in s {
		if vowels.contains(n) {vowelCount += 1}
		else {consonantCount += 1}
	}
	
	if vowelCount >= 1 && consonantCount >= 2 {return true}
	return false
}

func dfs(_ depth: Int, _ password: [String], _ idx: Int) {
	if depth == l {
		if check(password) {
			result.insert(password.sorted().joined())
		}
		return
	}
	for i in idx..<c {
		dfs(depth+1, password + [pb[i]], i+1)
	}
}

dfs(0, [], 0)

for r in result.sorted() {
	print(r)
}
