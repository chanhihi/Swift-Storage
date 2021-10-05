//
//  11654_아스키_코드.swift
//  
//
//  Created by Chan on 2021/10/05.
//
// https://www.acmicpc.net/problem/11654

import Foundation

var input = readLine() // string ~~ 

for index in input.utf8{
    print(index)
}
print(input[input.startIndex].asciiValue!)

// MARK: - character형 으로 받아 올 때
print(Character(readLine()!).asciiValue!)

// MARK: - string형으로 받아 올 때
var input = String(readLine()!)
print(input[input.startIndex].asciiValue)

// MARK: - unicodeScalar
print(UnicodeScalar(readLine()!)!.value)
