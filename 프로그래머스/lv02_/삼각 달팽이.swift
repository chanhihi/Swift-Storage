//
//  삼각 달팽이.swift
//  swift_practise
//
//  Created by Chan on 2022/07/02.
//	https://programmers.co.kr/learn/courses/30/lessons/68645

//	naive 하드코딩 / flatmap
import Foundation

func solution(_ n:Int) -> [Int] {
	
	var arr = [[Int]]()
	var n = n
	for i in 0..<n {
		arr.append([Int](repeating: 0, count: i + 1))
	}
	var current = 1
	
	var row = -1
	var col = 0
	while n > 0 {
		for _ in 0..<n {
			row += 1
			arr[row][col] = current
			current += 1
		}
		
//        print("아래 \(arr)")
		
		if n - 1 <= 0 {
			break
		}
		
		for _ in 0..<n - 1 {
			col += 1
			arr[row][col] = current
			current += 1
		}
		
//        print("오른쪽 \(arr)")
		
		if n - 2 <= 0 {
			break
		}
		
		for _ in 0..<n - 2 {
			row -= 1
			col -= 1
			arr[row][col] = current
			current += 1
		}
//        print("위 \(arr)")
		n -= 3
	}
	
	
	let answer = arr.flatMap { $0 }
	
	print(answer)
	
	return answer
	
}
