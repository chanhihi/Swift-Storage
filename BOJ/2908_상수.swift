//
//  2908_상수.swift
//  
//
//  Created by Chan on 2021/10/10.
//
//  https://www.acmicpc.net/problem/2908

var input = readLine()!
var n = input.split(separator: " ").map{ String($0) }
var ach : [Character] = []
var bch : [Character] = []

for char in n[0].reversed() {
    ach.append(char)
}
for char in n[1].reversed() {
    bch.append(char)
}

n[0] = (String)(ach)
n[1] = (String)(bch)

n.sort(by: >)

print(n[0])

// MARK: - 요약 정리

var n = readLine()!.split(separator: " ")
var a = String(n[0].map{ $0 }.reversed())
var b = String(n[1].map{ $0 }.reversed())

print(a > b ? a : b)
