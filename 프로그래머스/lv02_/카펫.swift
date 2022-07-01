//
//  카펫.swift
//  swift_practise
//
//  Created by Chan on 2022/07/02.
//
// MARK: - 완전탐색 / 수학

import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
	var sum = brown + yellow
	var (x,y) = (Int(sqrt(Double(sum))), Int(sqrt(Double(sum))))
	if x * y == sum {return [x,y]}
	for i in 1...sum{
		if sum%i == 0{
			x = sum/i
			y = i
		}
		if (x-2)*(y-2) == yellow {
			break
		}
	}
	return [x,y]
}
