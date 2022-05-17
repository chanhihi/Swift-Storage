//
//  lv01_숫자_문자열과_영단어.swift
//  
//
//  Created by Chan on 2022/05/17.
//
//	https://programmers.co.kr/learn/courses/30/lessons/81301?language=swift

// MARK: - 문자열 처리. replace 알아둘것.
import Foundation

func solution(_ s:String) -> Int {
	var result = ""
	result = s.replacingOccurrences(of: "zero", with: "0")
	result = result.replacingOccurrences(of: "one", with: "1")
	result = result.replacingOccurrences(of: "two", with: "2")
	result = result.replacingOccurrences(of: "three", with: "3")
	result = result.replacingOccurrences(of: "four", with: "4")
	result = result.replacingOccurrences(of: "five", with: "5")
	result = result.replacingOccurrences(of: "six", with: "6")
	result = result.replacingOccurrences(of: "seven", with: "7")
	result = result.replacingOccurrences(of: "eight", with: "8")
	result = result.replacingOccurrences(of: "nine", with: "9")
	return Int(result)!
}
