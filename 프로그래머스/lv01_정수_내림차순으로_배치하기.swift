//
//  lv01_정수_내림차순으로_배치하기.swift
//  
//
//  Created by Chan on 2022/06/26.
//
//	https://programmers.co.kr/learn/courses/30/lessons/12933

func solution(_ n:Int64) -> Int64 {
	var n = n
	var result = [String]()
	
	while (n != 0) {
		result.append(String(n % 10))
		n /= 10
	}
	
	return Int64(result.sorted(by: >).reduce("", +))!
}
