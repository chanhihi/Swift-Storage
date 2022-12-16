//
//  2309_일곱_난쟁이.swift
//  swift_practise
//
//  Created by Chan on 2022/12/15.
//
//	MARK: - brute force

import Foundation

var a = [Int]()
var result = [Int]()

for _ in 0..<9 {
	a.append(Int(readLine()!)!)
}

func brute (_ b: [Int], _ i: Int, _ d: Int) {
	var b = b
	if d >= 7 { return }
	b.append(a[i])
	if b.reduce(0, +) == 100 && d == 6 {
		b.sorted().forEach{
			print($0)
		}
		exit(0)
	}
	for i in i+1..<a.count{
		brute(b, i, d+1)
	}
}

for i in 0..<9{
	brute([], i, 0)
}
