//
//  15829_Hashing.swift
//  swift_practise
//
//  Created by Chan on 2022/07/19.
//
//	https://www.acmicpc.net/problem/15829

readLine()
let mod = 1234567891
var r = readLine()!.map{Int($0.asciiValue! - 96)}
var sum = 0
var m = 1
r.forEach {
	sum = (sum + $0*m) % mod
	m = (m * 31) % mod
}
print(sum)
