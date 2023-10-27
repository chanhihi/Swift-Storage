//
//  1358_하키.swift
//  swift_practise
//
//  Created by Chan on 2023/05/04.
//
//	https://www.acmicpc.net/problem/1358
//
//	MARK: - Type 추론을 정확히 해야한다. 타입명시 때문에 컴파일에러 많이뜸.

import Foundation

var WHXYP = readLine()!.split{$0==" "}.map{Double(String($0))!}
var (W, H, X, Y, P) = (WHXYP[0], WHXYP[1], WHXYP[2], WHXYP[3], WHXYP[4])

func isInSquare(_ a: Double, _ b: Double) -> Bool {
	if a >= X && a <= X + W && b >= Y && b <= Y + H { return true }
	return false
}

func isInCircle(_ a: Double, _ b: Double) -> Bool {
	if sqrt((X - a) * (X - a) + (Y + H / 2 - b) * (Y + H / 2 - b)) <= H / 2 { return true }
	else if sqrt((X + W - a) * (X + W - a) + (Y + H / 2 - b) * (Y + H / 2 - b)) <= H / 2 { return true }
	return false
}

var count = 0

for _ in 0..<Int(P) {
	let ab = readLine()!.split{$0==" "}.map{Double(String($0))!}
	if isInSquare(ab[0], ab[1]) {count += 1}
	else if isInCircle(ab[0], ab[1]) {count += 1}
}

print(count)
