//
//  lv02_타겟_넘버.swift
//  
//
//  Created by Chan on 2022/05/20.
//
//	https://programmers.co.kr/learn/courses/30/lessons/43165?language=swift

//	MARK: - dfs 개념 잡고가기.


import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
	var count = 0

	func dfs(_ depth: Int, _ sum: Int) {	// 재귀 사용해서 끝까지 다 봄.
		if depth == numbers.count {	//재귀 탈출조건 depth == count
			if sum == target {
				count += 1			// sum == target 의 경우 count++
			}
			return
		}
		dfs(depth + 1, sum + numbers[depth])	// + 해서 depth를 탐.
		dfs(depth + 1, sum - numbers[depth])	// - 해서 depth를 탐.
	}
	dfs(0,0)
	return count
}

solution([1, 1, 1, 1, 1],	3)//	5
//[4, 1, 2, 1]	4	2
