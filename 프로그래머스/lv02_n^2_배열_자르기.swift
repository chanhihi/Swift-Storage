//
//  lv02_n^2_배열_자르기.swift
//  swift_practise
//
//  Created by Chan on 2022/07/01.
//
//	https://programmers.co.kr/learn/courses/30/lessons/87390

//	MARK: - indexing 처리를 범위 안에서 map으로 구현할수있는가 (효율성 문제)
import Foundation

func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] { // 순차진행
	var arr = Array(repeating: Array(repeating:0, count:n), count: n)
	for i in 0..<n {
		for j in 0..<n {
			arr[i][j] = max(i,j) + 1
		}
	}
	var result = [Int]()
	var s = arr.flatMap{$0}
	for i in left...right {
		result.append(s[Int(i)])
	}
	print(result)
	return result
}

solution(3,	2,	5)//	[3,2,2,3]
solution(4,	7,	14)//	[4,3,3,3,4,4,4,4]
solution(4,	0,	15)
solution(1,	0,	0)

func solution_indexing(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
	// 범위 진행
	return (Int(left)...Int(right)).map{max($0/n,$0%n)+1} // 요약 풀이
	
	
	var arr = Array(repeating: 0, count: n*n)
	for i in 0..<n*n {
		arr[i] = max(i%n,i/n)+1
	}
	print(arr[Int(left)...Int(right)].map{Int($0)})
	return arr[Int(left)...Int(right)].map{Int($0)}
}
