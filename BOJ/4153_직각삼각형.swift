//
//  4153_직각삼각형.swift
//  swift_practise
//
//  Created by Chan on 2022/07/25.
//
//https://www.acmicpc.net/problem/4153

while let r = readLine(){
	var l = r.split(separator: " ").map{Int(String($0))!}
	if l[0] == 0 && l[1] == 0 && l[2] == 0 {break}
	l.sort()
	let m = l.last!
	if (m * m) == l[0] * l[0] + l[1] * l[1] {print("right")}
	else {print("wrong")}
}
