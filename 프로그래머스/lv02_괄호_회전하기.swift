//
//  lv02_괄호_회전하기.swift
//  swift_practise
//
//  Created by Chan on 2022/07/01.
//
//	https://programmers.co.kr/learn/courses/30/lessons/76502

//MARK: - 괄호 문제, dict, 스택(stack)
import Foundation

func solution(_ s:String) -> Int {
	var s = s
	var count = 0
	for _ in 0..<s.count {
		if isCorrect(s) { count+=1 }
		s.append(s.removeFirst())
	}
	return count
}

let brackets = ["{":"}", "(":")", "[":"]"]
func isCorrect(_ s:String) -> Bool {
	var stack = [String]()
	for bracket in s {
		if brackets.keys.contains(String(bracket)) {
			stack.append(String(bracket))
		}else {
			if !stack.isEmpty {
				if brackets[stack.last!] != String(bracket) {
					return false
				}else {
					stack.removeLast()
				}
			}else {
				return false
			}
		}
	}
	return stack.isEmpty ? true : false
}
