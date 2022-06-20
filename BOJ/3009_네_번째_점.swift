//
//  3009_네_번째_점.swift
//  
//
//  Created by Chan on 2022/06/20.
//
//	https://www.acmicpc.net/problem/3009

// MARK: - 수학 문제
var x = Array(repeating: 0, count: 3)
var y = Array(repeating: 0, count: 3)
var X = 0
var Y = 0

for i in 0..<3 {
	let n = readLine()!.split(separator: " ").map{ Int($0)! }
	x[i] = n[0]
	y[i] = n[1]
}

if x[0] == x[1] { X = x[2] }
else { if x[1] == x[2] { X = x[0] } else { X = x[1] } }

if y[0] == y[1] { Y = y[2] }
else { if y[1] == y[2] { Y = y[0] } else { Y = y[1] } }

print(X, Y)
