//
//  1764_듣보잡.swift
//  swift_practise
//
//  Created by Chan on 2022/08/06.
//
//https://www.acmicpc.net/problem/1764

//	MARK: - set contains = O(1)
import Foundation
let l = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, M) = (l[0], l[1])
var n = Set<String>()
var result = [String]()
for _ in 0..<N{
	n.insert(readLine()!)
}
for _ in 0..<M{
	let m = readLine()!
	if n.contains(m) {
		result.append(m)
	}
}
print(result.count)
print(result.sorted().joined(separator: "\n"))
