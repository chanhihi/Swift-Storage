//
//  11098.swift
//  
//
//  Created by Chan on 2022/06/28.
//
//	https://www.acmicpc.net/problem/11098

let n = Int(readLine()!)!
var maxValue = 0
var maxString = ""

for _ in 0..<n {
	let p = Int(readLine()!)!
	for _ in 0..<p {
		let c = readLine()!.split(separator: " ").map{String($0)}
		if maxValue < Int(c[0])! {
			maxValue = Int(c[0])!
			maxString = c[1]
		}
	}
	print(maxString)
}
