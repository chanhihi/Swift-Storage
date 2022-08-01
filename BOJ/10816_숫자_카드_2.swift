//
//  10816_숫자_카드_2.swift
//  swift_practise
//
//  Created by Chan on 2022/08/01.
//
//	https://www.acmicpc.net/problem/10816

//	MARK: - dictionary 딕셔너리 기초
var result = [String]()
var dicCard = [Int:Int]()
readLine()
let dic = readLine()!.split(separator: " ").map{Int(String($0))!}
dic.forEach {
	if dicCard[$0] == nil { dicCard[$0] = 1 }
	else {dicCard[$0]! += 1}
}
readLine()
let key = readLine()!.split(separator: " ").map{Int(String($0))!}
key.forEach{
	result.append(String(dicCard[$0] ?? 0))
}
print(result.joined(separator: " "))
