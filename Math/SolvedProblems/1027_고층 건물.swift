//
//  1027_고층 건물.swift
//  swift_practise
//
//  Created by Chan on 2023/04/19.
//
//	https://www.acmicpc.net/problem/1027
//
//	MARK: - Math, BruteForce
//	Stride 관련 문제로 두번 빠꾸당함.

import Foundation

var n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int(String($0))!}
var cnt = Array(repeating: 0, count: n + 1)
var count = 0
arr = [0] + arr

for now in 1...n {
	var maxx: Double = -9999999999
	for i in stride(from: now+1, through: n, by: 1){
		let level: Double = Double(arr[i] - arr[now]) / Double((i - now))
		if (level > maxx) {
			cnt[now] += 1
			cnt[i] += 1
			maxx = level
		}
	}
}
for i in 1...n {
	count = max(count, cnt[i])
}
print(count)
