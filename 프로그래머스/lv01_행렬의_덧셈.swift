//
//  lv01_행렬의_덧셈.swift
//  
//
//  Created by Chan on 2022/06/27.
//
//	https://programmers.co.kr/learn/courses/30/lessons/12950

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
	var result = arr2
	for j in 0..<arr1.count {
		for i in 0..<arr1[j].count {
			result[j][i] += arr1[j][i]
		}
	}
	return result
}


// MARK: - zip 사용 풀이

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
	return zip(arr1, arr2).map{zip($0,$1).map{$0+$1}}
}

