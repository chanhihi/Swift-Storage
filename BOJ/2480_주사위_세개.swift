//
//  2480_주사위_세개.swift
//  
//
//  Created by Chan on 2022/06/21.
//
//	https://www.acmicpc.net/problem/2480

// MARK: - 기본 조건문.
var q =  readLine()!.split(separator:" ").map { Int($0)! }
var result = 0

if (q[0] == q[1]) {
	result = 1000 + (q[0] * 100)
	if (q[0] == q[2]) {
		if (q[1] == q[2]) {
			result = 10000 + (q[0] * 1000)
		}
	}
} else if (q[1] == q[2]) {
	result = 1000 + (q[1] * 100)
} else if (q[2] == q[0]) {
	result = 1000 + (q[0] * 100)
}
else {
	result = max(q[0],q[1],q[2]) * 100
}

print(result)
