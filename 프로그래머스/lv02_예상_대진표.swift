//
//  lv02_예상_대진표.swift
//  
//
//  Created by Chan on 2022/06/27.
//
//	https://programmers.co.kr/learn/courses/30/lessons/12985

//	MARK: - ***
func solution(_ n:Int, _ a:Int, _ b:Int) -> Int
{
	var a = a, b = b
	var answer = 0
	while a != b {
		if a % 2 == 1 {
			a = (a + 1) / 2
		} else {
			a = a / 2
		}
		if b % 2 == 1 {
			b = (b + 1 ) / 2
		} else {
			b = b / 2
		}
		answer += 1
	}
	return answer
}
