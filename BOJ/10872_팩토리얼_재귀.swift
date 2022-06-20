//
//  10872_팩토리얼_재귀.swift
//  
//
//  Created by Chan on 2022/06/21.
//
//	https://www.acmicpc.net/problem/10872

// MARK: - 재귀 사용 풀이

//let r = Int(readLine()!)!
let r = 12
func recursive (_ n: Int) -> Int {
	if n == 0 {
		return 1
	}
	return (n * recursive(n - 1))
}

recursive(r)
