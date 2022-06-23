//
//  lv01_문자열_내림차순으로_배치하기.swift
//  
//
//  Created by Chan on 2022/06/23.
//
//	https://programmers.co.kr/learn/courses/30/lessons/12917

func solution(_ s:String) -> String {
	return s.map{String($0)}.sorted(by:>).joined()
}
