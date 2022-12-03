//
//  1030_프렉탈_평면.swift
//  swift_practise
//
//  Created by Chan on 2022/12/03.
//
//	https://www.acmicpc.net/problem/1030

import Foundation

var l = readLine()!.split(separator: " ").map{Int(String($0))!}
var (s, n, k, r1, r2, c1, c2) = (l[0], l[1], l[2], l[3], l[4], l[5], l[6])

func check(_ len: Int, _ x: Int, _ y: Int) -> Int {
	if len == 1 { return 0 }
	var border = len / n
	if x >= border * (n - k) / 2 && x < border * (n + k) / 2 && y >= border * (n - k) / 2 && y < border * (n + k) / 2 { return 1 }
	return check(border, x % border, y % border)
}

if (s == 0) { print(0);exit(0) }

var len = 1
var result = ""
while (s != 0) {
	len *= n
	s -= 1
}
for i in r1...r2 {
	for j in c1...c2 {
		result += String(check(len, i, j))
	}
	print(result)
	result = ""
}
