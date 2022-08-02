//
//  2751_수_정렬하기_2.swift
//  swift_practise
//
//  Created by Chan on 2022/08/02.
//
//	https://www.acmicpc.net/problem/2751

//	MARK: - 기본 정렬 문제

let K = Int(readLine()!)!
var stack = [Int]()
for _ in 0..<K {
	stack.append(Int(readLine()!)!)
}
stack.sorted().forEach {
	print($0)
}
