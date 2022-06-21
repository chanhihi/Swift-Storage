//
//  짝지어_제거하기.swift
//  
//
//  Created by Chan on 2021/12/12.
//
//	https://programmers.co.kr/learn/courses/30/lessons/12973

/// 재풀이 : char stack구조에 있어서 last / remove last 활용.

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

// MARK: - 짝지어 제거하기 효율성 고려 X
import Foundation
func solution(_ s:String) -> Int{
    var String = [Character](s)
	
	func deleteNext(_ s: [Character], _ index: Int) {
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

    deleteNext(String, 0)
	
    print(String)
    if String.isEmpty {
        return 1
    } else {
        return 0
    }
}

import Foundation

func solution2(_ s:String) -> Int{
	var S = s.map { String($0) }
	var index = 0
	var prevValue: String = ""

	while (index < S.count) {
		if prevValue == S[index] {
			S.remove(at: index)
			S.remove(at: index-1)
			prevValue = ""
		}
		else {
			prevValue = S[index]
			index += 1
		}
	}
	print(S)

	if S.isEmpty {
		return 1
	} else {
		return 0
	}
}

solution("baabaa")
solution("cdcd")
solution("aaabbbaabbba")
