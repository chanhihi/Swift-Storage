//
//  lv01_문자열_내_p와_y의_개수.swift
//
//
//  Created by Chan on 2022/06/23.
//
//	https://programmers.co.kr/learn/courses/30/lessons/12916

import Foundation

//	MARK: - components 활용법 / filter 활용법 제대로 알고 넘어가기.
//

func solution(_ s:String) -> Bool
{
	var pC = 0
	var yC = 0

	s.forEach {
		if $0 == "p" || $0 == "P" {
			pC += 1
		} else if $0 == "y" || $0 == "Y" {
			yC += 1
		}
	}
	return pC == yC ? true : false
}

func solution_components(_ s:String) -> Bool
{
	return s.lowercased().components(separatedBy: "p").count == s.lowercased().components(separatedBy: "y").count
}

func solution_filter(_ s:String) -> Bool
{
	return s.lowercased().filter { $0 == "p" }.count == s.lowercased().filter { $0 == "y" }.count
}
solution("pPoooyY")//	true
solution("Pyy")//	false
