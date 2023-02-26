//
//  1105_팔.swift
//  swift_practise
//
//  Created by Chan on 2023/02/17.
//
//	https://www.acmicpc.net/problem/1105
//
//	MARK: - greedy이지만 그리디로 풀면 시간초과가 나므로 예외부분으로 조건 분기

let i = readLine()!.split{$0==" "}.map{String($0)}
var (l, r) = (i[0].map{String($0)}, i[1].map{String($0)})
var result = 0

if l.count == r.count {
	for i in 0..<l.count {
		if l[i]==r[i]{ if l[i]=="8" {result += 1} }
		else { break }
	}
}
print(result)
