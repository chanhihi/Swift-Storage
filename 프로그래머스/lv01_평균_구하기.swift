//
//  lv01_평균_구하기.swift
//  
//
//  Created by Chan on 2022/06/26.
//
//	https://programmers.co.kr/learn/courses/30/lessons/12944

func solution(_ arr:[Int]) -> Double {
	var sum: Double = 0
	arr.forEach {
		sum += Double($0)
	}
	return sum / Double(arr.count)
}

func solution_reduce(_ arr:[Int]) -> Double {
	return Double(arr.reduce(0,+)) / Double(arr.count)
}
