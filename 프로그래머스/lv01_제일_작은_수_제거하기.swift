//
//  lv01_제일_작은_수_제거하기.swift
//  
//
//  Created by Chan on 2022/06/26.
//
//	https://programmers.co.kr/learn/courses/30/lessons/12935

//	MARK: - filter 사용 기본 !!!

func solution(_ arr:[Int]) -> [Int] {
	let arrMin = arr.min()
	return arr.count == 1 ? [-1] : arr.filter{$0 != arrMin}
}
