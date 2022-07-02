//
//  이진 변환 반복하기.swift
//  swift_practise
//
//  Created by Chan on 2022/07/02.
//
//	https://programmers.co.kr/learn/courses/30/lessons/70129

//	MARK: - filter 와 stinrg radix 사용으로 간편하게 구성
import Foundation

func solution(_ s:String) -> [Int] {
	
	var s = s
	var count = 0, times = 0
	while s != "1" {
		let replaceCount = s.filter { $0 == "0" }.count
		count += replaceCount

		s = String(s.count - replaceCount, radix: 2)
		times += 1
	}
	
	return [times, count]
}
