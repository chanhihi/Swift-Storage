//
//  2422_별_찍기_반전.swift
//  
//
//  Created by Chan on 2021/12/01.
//
//  https://www.acmicpc.net/problem/2442
// 별찍기 - 5 반전

// MARK: - 기존 형식 + 점화식으로 문제 풀이
// 다음 별 갯수 = 이전 별 갯수 + 현재 별 갯수

let a = Int(readLine()!)!
var space = ""
var star = ""
var nextStar = ""
for i in (1...a) {
    space = String(repeating: " ", count: a - i)
    star = String(repeating: "*", count: i)
    print("\(space)\(star)\(nextStar)")
    nextStar = star
}

// MARK: - 별 갯수 i * 2 + 1 사용
// Line 당 별 갯수 1,3,5,7,9 ... 2n+1 사용

let num = Int(readLine()!)!
for i in 0 ..< num {
  print(String(repeating: " ", count: num - i - 1) + String(repeating: "*", count: i * 2 + 1))
}
