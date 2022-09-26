//
//  1049_기타줄.swift
//  swift_practise
//
//  Created by Chan on 2022/09/25.
//
//	https://www.acmicpc.net/problem/1049
//	MARK: - 수학 / 그리디 알고리즘

import Foundation

let l = readLine()!.split(separator: " ").map{Int(String($0))!}
var (N, M) = (l[0], l[1])
var pack = [Int]()
var separate = [Int]()

for _ in 0..<M {
	let m = readLine()!.split(separator: " ").map{Int(String($0))!}
	pack.append(m[0])
	separate.append(m[1])
}

var p = pack.sorted().first!
var s = separate.sorted().first!

print(min(N/6*p+N%6*s, s*N, ((N/6)+1)*p))
