//
//  lv01_문자열_다루기_기본.swift
//  
//
//  Created by Chan on 2022/06/23.
//
//	https://programmers.co.kr/learn/courses/30/lessons/12918

func solution(_ s:String) -> Bool {
	if s.count != 4 && s.count != 6 { return false }
	for i in s {
		if i < "0" || i > "9" { return false }
	}
	return true
}
