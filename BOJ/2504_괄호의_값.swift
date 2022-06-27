//
//  2504_괄호의_값.swift
//  
//
//  Created by Chan on 2022/06/27.
//
//	https://www.acmicpc.net/submit/2504
//
//	MARK: - 스택구조 기본
let x = readLine()!.map{String($0)}
var charStack = [Character]()
var lastChar: Character? = nil
var result = 0
var temp = 1
var cX = x.map{Character(String($0))}
var fail = true

for (i, char) in cX.enumerated() {
	if char == "(" {
		temp *= 2
		charStack.append(char)
		lastChar = char
	} else if char == "[" {
		temp *= 3
		charStack.append(char)
		lastChar = char
	} else if char == ")" {
		if charStack.isEmpty || lastChar != "(" {
			fail = false
		}
		if lastChar == "(" {
			charStack.removeLast()
			lastChar = charStack.last
			let index = i - 1
			if cX[index] == "(" { result += temp }
		}
		temp /= 2
	} else if char == "]" {
		if charStack.isEmpty || lastChar != "[" {
			fail = false
		}
		if lastChar == "[" {
			charStack.removeLast()
			lastChar = charStack.last
			let index = i - 1
			if cX[index] == "[" { result += temp }
		}
		temp /= 3
	}
}

if !fail || !charStack.isEmpty {
	print(0)
} else {
	print(result)
}
