//
//  1748_수 이어쓰기 1.swift
//  swift_practise
//
//  Created by Chan on 2023/02/28.
//
//	https://www.acmicpc.net/problem/1748
//
//	MARK: - Math

var n = Int(readLine()!)!
var i = 1, r = 0
while i <= n {
	r += (n-i+1)
	i *= 10
}

print(r)
