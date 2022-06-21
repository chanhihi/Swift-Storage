//
//  lv01_[1차]_비밀지도.swift
//  
//
//  Created by Chan on 2022/06/21.
//
//	https://programmers.co.kr/learn/courses/30/lessons/17681

// MARK: - string format %ld까지 고려 잘 할것.
import Foundation

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
	var arr3 = arr1
	var result:[String] = Array(repeating: "", count: n)
	var answer = result
	
	for i in 0..<n {
		arr3[i] |= arr2[i]
		let j = Int(String(arr3[i], radix: 2))!
		result[i] = String(format: "%0\(n)ld", j)
		for s in result[i] {
			if s == "1" { answer[i].append("#") }
			else { answer[i].append(" ")}
		}
	}
	return answer
}
