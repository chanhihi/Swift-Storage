//
//  11659_구간_합_구하기_4.swift
//  swift_practise
//
//  Created by Chan on 2022/08/16.
//
//	https://www.acmicpc.net/problem/11659
//

//	MARK: - 누적 합

let n = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, M) = (n[0], n[1])
let a = readLine()!.split(separator: " ").map{Int(String($0))!}
var psum = Array(repeating: a[0], count: N)
for i in 1..<N{
	psum[i] = psum[i-1] + a[i]
}
var result = ""
for _ in 0..<M{
	let r = readLine()!.split(separator: " ").map{Int(String($0))!}
	let sum = psum[r[1]-1] - (r[0]-1 == 0 ? 0 : psum[r[0]-2])
	result += "\(sum)\n"
}
print(result)
