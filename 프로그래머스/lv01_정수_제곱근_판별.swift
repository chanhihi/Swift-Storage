//
//  lv01_정수_제곱근_판별.swift
//  
//
//  Created by Chan on 2022/06/26.
//
//	https://programmers.co.kr/learn/courses/30/lessons/12934

func solution(_ n:Int64) -> Int64 {
	var result:Int64 = 0
	let i = isSqrt(n)
	if i < 0 {
		return -1
	} else {
		result = i + 1
	}
	
	return result * result
}

func isSqrt(_ nb : Int64) -> Int64 {
	var number = 0

	if (nb > 0) {
		while (number * number <= nb) {
			if (number * number == nb) {
				return Int64 (number)
			}
			number+=1
		}
	}
	return -1
}
