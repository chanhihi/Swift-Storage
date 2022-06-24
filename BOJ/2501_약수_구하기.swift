//
//  2501_약수_구하기.swift
//  
//
//  Created by Chan on 2022/06/24.
//
//	https://www.acmicpc.net/problem/2501

//	MARK: - 간단한 수학문제...

let a = readLine()!.split(separator:" ").map{Int($0)!}
//let a = "10000 4".split(separator:" ").map{Int($0)!}
let (N, K) = (a[0], a[1])
var count = 0
var result = 0
for i in 1...N {
	if N % i == 0 {
//		print(N, i, N%i)
		count += 1
		if K == count {
			result = i
		}
	}
}
print(result)
