//
//  lv01_문자열_내_마음대로_정렬하기.swift
//  
//
//  Created by Chan on 2022/06/23.
//
//	https://programmers.co.kr/learn/courses/30/lessons/12915

// 간단하지만 중요한 개념. 절대 확인하고 넘어갈 것. 검색 키워드 : 배열 정렬 숫자 번호

//	MARK: - sort 배열 마음대로 정의하기. ****중요
import Foundation

func solution(_ strings:[String], _ n:Int) -> [String] {
	return strings.sorted{Array($0)[n] == Array($1)[n] ? $0 < $1 : Array($0)[n] < Array($1)[n]}
}
