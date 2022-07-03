//
//  2475_검증수.swift
//  swift_practise
//
//  Created by Chan on 2022/07/03.
//
//	https://www.acmicpc.net/problem/2475

import Foundation
var v = readLine()!.split(separator: " ").map{pow(Double($0)!, 2.0)}
print(Int(v.reduce(0, +)) % 10)
