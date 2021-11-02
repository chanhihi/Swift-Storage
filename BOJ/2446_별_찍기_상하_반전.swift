//
//  2446_별_찍기_상하_반전.swift
//  
//
//  Created by Chan on 2021/11/02.
//
//https://www.acmicpc.net/problem/2446

let a = Int(readLine()!)!
var space = ""
var star = ""

for i in 0 ..< a {
  print(String(repeating: " ", count: i) + String(repeating: "*", count: 2*(a-i) - 1))
}
for i in 1 ..< a {
  print(String(repeating: " ", count: a - i - 1) + String(repeating: "*", count: i * 2 + 1))
}
