//
//  lv02_위장.swift
//  swift_practise
//
//  Created by Chan on 2022/07/01.
//
//	https://programmers.co.kr/learn/courses/30/lessons/42578
//	MARK: - dict 초기화해서 넣는법. dic / 입을 수 있는 모든 경우의 수
import Foundation
func solution(_ clothes:[[String]]) -> Int {
	var dic = [String:[String]]()
	for c in clothes {
		if dic[c[1]] != nil {dic[c[1]]!.append(c[0])}
		else {
			dic[c[1]] = [String]()
			dic[c[1]]!.append(c[0])
		}
	}
	var sup = 1
	for (key, value) in dic {
		sup *= (value.count+1)
	}
	return sup - 1
}
