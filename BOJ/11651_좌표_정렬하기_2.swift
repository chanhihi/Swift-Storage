//
//  11651_좌표_정렬하기_2.swift
//  swift_practise
//
//  Created by Chan on 2022/07/25.
//
//	https://www.acmicpc.net/problem/11651

//	MARK: - 튜플 사용해서 정렬. 2차원 배열 정렬

let N = Int(readLine()!)!
var L = [[Int]]()
for _ in 0..<N {
	let l = readLine()!.split(separator: " ").map{Int(String($0))!}
	L.append(l)
}
L.sorted{($0[1], $0[0]) < ($1[1], $1[0])}.forEach {
	print($0[0], $0[1])
}
