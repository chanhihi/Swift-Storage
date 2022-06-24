//
//  2750_수_정렬하기.swift
//  
//
//  Created by Chan on 2022/06/24.
//
//	https://www.acmicpc.net/problem/2750

import Foundation

var n = Int(readLine()!)!
var a = [Int]()
for _ in 0..<n {
	a.append(Int(readLine()!)!)
}
a.sorted().forEach {
	print($0)
}
