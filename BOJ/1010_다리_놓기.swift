//
//  1010_다리_놓기.swift
//  swift_practise
//
//  Created by Chan on 2022/07/01.
//
//	https://www.acmicpc.net/problem/1010

// MARK: - dp, 재귀 한번 더 생각해볼것 (nCr)문제

var result = Array(repeating: Array(repeating: 0, count: 31), count: 31)

let I = Int(readLine()!)!

for _ in 0..<I {
	let a = readLine()!.split(separator: " ").map {Int(String($0))!}
	let (N, M) = (a[0], a[1])
	print(br(N,M))
}

func br (_ n:Int,_ m: Int) -> Int {
	if n == m || n == 0 { return 1 }
	if result[n][m] != 0 {
		return result[n][m]
	}
	result[n][m] = br(n-1, m-1) + br(n,m-1)
	return result[n][m]
}
