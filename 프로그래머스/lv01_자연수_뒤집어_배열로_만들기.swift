//
//  lv01_자연수_뒤집어_배열로_만들기.swift
//  
//
//  Created by Chan on 2022/06/26.
//
//	https://programmers.co.kr/learn/courses/30/lessons/12932

func solution(_ n:Int64) -> [Int] {
	var n = n
	var result = [Int]()
	
	while (n != 0) {
		result.append(Int(n % 10))
		n /= 10
	}
	
	return result
}
