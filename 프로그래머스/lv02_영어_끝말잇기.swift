//
//  lv02_영어_끝말잇기.swift
//  swift_practise
//
//  Created by Chan on 2022/07/01.
//
//	https://programmers.co.kr/learn/courses/30/lessons/12981

import Foundation // 틀린 단어 + 중복 단어

var storage = [String]()
var result = [0,0]
func solution(_ n:Int, _ words:[String]) -> [Int] {
	var lastWord = words[0].first
	for (i, v) in words.enumerated() {
		if lastWord != v.first {
			result[0] = i%n+1
			result[1] = i/n+1
			break
		}
		if storage.contains(v) {
			result[0] = i%n+1
			result[1] = i/n+1
			break
		}
		storage.append(v)
		lastWord = v.last
	}
	return result
}
