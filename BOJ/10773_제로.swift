//
//  10773_제로.swift
//  swift_practise
//
//  Created by Chan on 2022/08/02.
//
//	 https://www.acmicpc.net/problem/10773

// MARK: - 기본 스택 구조 문제 / Stack
let K = Int(readLine()!)!
var stack = [Int]()
for _ in 0..<K {
	let a = Int(readLine()!)!
	if a == 0 { stack.popLast() }
	else { stack.append(a) }
}
if stack.isEmpty { print(0) }
else { print(stack.reduce(0, +)) }
