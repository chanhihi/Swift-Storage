//
//  lv01_이상한_문자_만들기.swift
//  
//
//  Created by Chan on 2022/06/26.
//
//	https://programmers.co.kr/learn/courses/30/lessons/12930

func solution(_ s:String) -> String {
	var result = ""
	var wordCount = 0
	
	s.forEach {
		if wordCount == 0 && $0 != " "{
			result.append($0.uppercased())
			wordCount += 1
		} else {
			result.append($0.lowercased())
			wordCount = 0
		}
	}
	return result
}
