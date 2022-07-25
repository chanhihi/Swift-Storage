//
//  2798_블랙잭.swift
//  swift_practise
//
//  Created by Chan on 2022/07/25.
//
//	https://www.acmicpc.net/problem/2798

var l = readLine()!.split(separator: " ").map{Int(String($0))!}
var m = readLine()!.split(separator: " ").map{Int(String($0))!}
var (N, M) = (l[0], l[1])
var maxResult = 0

func cardSum(_ depth:Int,_ cur:Int, _ sum:Int) {
	if depth == 2 && sum <= M {
//		print(maxResult, sum)
		maxResult = max(maxResult, sum)
		return
	} else if sum > M { return }
	for i in cur..<N-1 {
		cardSum(depth+1, i+1, sum+m[i+1])
	}
}

for n in 0...N-3 {
//	print(" >> ",n)
	cardSum(0, n, m[n])
}
print(maxResult)
