//
//  lv01_두_정수_사이의_합.swift
//  
//
//  Created by Chan on 2022/06/23.
//
//	https://programmers.co.kr/learn/courses/30/lessons/12912

func solution(_ a:Int, _ b:Int) -> Int64 {
	var sum: Int64 = 0
	var (a, b) = (min(a,b), max(a,b))
	for i in a...b {
		sum += Int64(i)
	}
	return sum
}
