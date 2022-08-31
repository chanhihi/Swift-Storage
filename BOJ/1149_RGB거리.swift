//
//  1149_RGB거리.swift
//  swift_practise
//
//  Created by Chan on 2022/08/31.
//
//	https://www.acmicpc.net/problem/1149

//	MARK: - DP

let N = Int(readLine()!)!
var p = [[Int]]()
var d = Array(repeating: Array(repeating: 0, count: 3), count: N+1)
for _ in 0..<N{
	p.append(readLine()!.split{$0==" "}.map{Int($0)!})
}
for i in 1...N{
	d[i][0] = min(d[i-1][1], d[i-1][2]) + p[i-1][0]
	d[i][1] = min(d[i-1][0], d[i-1][2]) + p[i-1][1]
	d[i][2] = min(d[i-1][1], d[i-1][0]) + p[i-1][2]
}
print(d[N].min()!)
