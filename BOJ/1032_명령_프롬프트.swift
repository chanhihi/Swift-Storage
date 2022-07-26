//
//  1032_명령_프롬프트.swift
//  swift_practise
//
//  Created by Chan on 2022/07/26.
//
//	https://www.acmicpc.net/problem/1032

let N = Int(readLine()!)!
var result = readLine()!.map{String($0)}
for _ in 0..<N-1{
	let l = readLine()!.map{String($0)}
	for (i, v) in l.enumerated() {if v != result[i] {result[i] = "?"}}
}
print(result.joined())
