//
//  짝지어_제거하기.swift
//  
//
//  Created by Chan on 2021/12/12.
//
//	https://programmers.co.kr/learn/courses/30/lessons/12973?language=swift

// 재풀이 : Stack 구조에 대한 이해.
// MARK: - 효율성 고려 스택으로 문제 해결

func solution(_ s: String) -> Int {
	var charStack = [Character]()
	var lastChar: Character? = nil

	for char in [Character](s) {
		if lastChar != nil && char == lastChar {
			charStack.removeLast()
			lastChar = charStack.last
		} else {
			charStack.append(char)
			lastChar = char
		}
	}
	if charStack.isEmpty {
		return 1
	} else {
		return 0
	}
}

// MARK: - 짝지어 제거하기 효율성 X

import Foundation

func solution(_ s:String) -> Int{
    var answer:Int = -1
    var String = [Character](s)
    deleteNext(&String, 0)
    
    print(String)
    
    if String.isEmpty {
        return 1
    } else {
        return 0
    }
}

func deleteNext(_ s: inout [Character], _ index: Int) {
    if index+1 >= s.count {
        return
    }
    
    if s[index] == s[index+1] {
        s.remove(at: index)
        s.remove(at: index)
        
        if index-1 < 0 {
            deleteNext(&s, index)
        } else {
        deleteNext(&s, index-1)
        }
    } else {
        deleteNext(&s, index+1)
    }
}

solution("baabaa")

