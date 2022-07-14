//
//  1436_영화감독_숌.swift
//  swift_practise
//
//  Created by Chan on 2022/07/15.
//
//	https://www.acmicpc.net/problem/1436

import Foundation // String.contains 사용을 위해서 필요함.

let n = Int(readLine()!)!
var count = 0

if n < 5001 {
	for i in 666...1466659 {
		let v = String(i)
		if v.contains("666") {
			count += 1
			if count == n {print(v);break}
		}
	}
} else {
	count = 5000
	for i in 1466660...2666799 {
		let v = String(i)
		if v.contains("666") {
			count += 1
			if count == n {print(v);break}
		}
	}
}
