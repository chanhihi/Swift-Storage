//
//  2839_설탕 배달.swift
//  swift_practise
//
//  Created by Chan on 2023/03/15.
//
//	https://www.acmicpc.net/problem/2839
//
//	MARK: - greedy / dp

/*
 print([4,7].contains(N) ? -1:N-2*N/5*2) 4, 7 제외한 입력들 (3 ≤ N ≤ 5000)은 식으로 출력 가능.
 */

var N = Int(readLine()!)!
var result = 0

while true {
	if N % 5 == 0 { result += N / 5 ; break }
	
	N -= 3
	result += 1
	
	if N < 0 { result = -1 ; break }
}

print(result);

