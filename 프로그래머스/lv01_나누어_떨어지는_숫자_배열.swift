//
//  lv01_나누어_떨어지는_숫자_배열.swift
//  
//
//  Created by Chan on 2022/06/23.
//
//	https://programmers.co.kr/learn/courses/30/lessons/12910

func solution(_ arr:[Int], _ divisor:Int) -> [Int] {
	var result = [Int]()
	arr.forEach {
		if $0 % divisor == 0 {
			result.append($0)
		}
	}
	return result.count > 0 ? result.sorted() : [-1]
}
