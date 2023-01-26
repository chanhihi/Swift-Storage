//
//  1024_수열의 합.swift
//  swift_practise
//
//  Created by Chan on 2023/03/05.
//
//	https://www.acmicpc.net/problem/1748
//
//	MARK: - Math,

import Foundation

let NL = readLine()!.split(separator: " ").map{Int(String($0))!}
var (N, L) = (NL[0], NL[1])

for l in L...100 {
	let tg = N - l * (l + 1) / 2
	if tg % l == 0 {
		let x = tg / l + 1 ;
		if x >= 0 {
			print(Array(x..<l+x).map{String($0)}.joined(separator: " "))
			exit(0)
		}
	}
}
print(-1)
