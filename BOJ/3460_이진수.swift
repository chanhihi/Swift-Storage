//
//  3460_이진수.swift
//  
//
//  Created by Chan on 2022/06/24.
//
//	https://www.acmicpc.net/problem/3460

//	MARK: - while let readline 적당히 쓸것. (런타임에러, 컴파일에러)

let n = Int(readLine()!)!
for _ in 0..<n {
	let N = Int(readLine()!)!
	let binary = String(N, radix: 2)
	
	for (i, v) in binary.reversed().enumerated() {
		if v == "1" {
			print(i, terminator: " ")
		}
	}
}
