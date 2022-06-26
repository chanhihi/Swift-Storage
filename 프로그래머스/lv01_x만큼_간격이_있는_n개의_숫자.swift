//
//  lv01_x만큼_간격이_있는_n개의_숫자.swift
//  
//
//  Created by Chan on 2022/06/27.
//
//	https://programmers.co.kr/learn/courses/30/lessons/12954


func solution(_ x:Int, _ n:Int) -> [Int64] {
	var result = [Int64]()
	for i in 1...n {
		result.append(Int64(x * i))
	}
	return result
}

// MARK: - map 이용 풀이

func solution(_ x:Int, _ n:Int) -> [Int64] {
	return Array(1...n).map { Int64($0 * x) }
}
