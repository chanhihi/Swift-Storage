//
//  7568_덩치.swift
//  swift_practise
//
//  Created by Chan on 2022/08/02.
//
//	https://www.acmicpc.net/problem/7568

//	MARK: - tuple / 구현 / 브루트포스 알고리즘

let K = Int(readLine()!)!
var info = [(Int, Int)]()
for _ in 0..<K {
	let r = readLine()!.split(separator: " ").map{Int(String($0))!}
	info.append((r[0], r[1]))
}
var rank = Array(repeating: 1, count: info.count)
for i in 0..<K {
	for j in 0..<K {
		if info[i].0 < info[j].0 && info[i].1 < info[j].1 {
			rank[i] += 1
		}
	}
}
print(rank.map{String($0)}.joined(separator: " "))

