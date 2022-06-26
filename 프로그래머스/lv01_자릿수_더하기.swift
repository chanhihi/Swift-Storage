//
//  lv01_자릿수_더하기.swift
//  
//
//  Created by Chan on 2022/06/26.
//
//	https://programmers.co.kr/learn/courses/30/lessons/12931

func solution(_ n:Int) -> Int
{
	var n = n
	var answer:Int = 0
	
	while (n != 0) {
		answer += n % 10
		n /= 10
	}
	
	return answer
}
