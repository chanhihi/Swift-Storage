//
//  lv01_가운데_글자_가져오기.swift
//  
//
//  Created by Chan on 2022/06/21.
//
//	https://programmers.co.kr/learn/courses/30/lessons/12903

func solution(_ s:String) -> String {
	var i = s.count / 2
	var t = s.map { String($0) }
	if s.count % 2 == 0 {
		return t[i-1] + t[i]
	} else {
		return t[i]
	}
}

solution("abcde")
solution("qwer")
