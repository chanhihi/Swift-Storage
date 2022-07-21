//
//  2231_분해합.swift
//  swift_practise
//
//  Created by Chan on 2022/07/18.
//
//	https://www.acmicpc.net/problem/2231

import Foundation // exit 사용
var n = Int(readLine()!)!
for i in 1...1000000 {
	if (String(i).map{Int(String($0))!}.reduce(0,+) + i == n){
		print(i)
		exit(0)
	}
}
print(0)
