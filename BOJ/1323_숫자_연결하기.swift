//
//  1323_숫자_연결하기.swift
//  swift_practise
//
//  Created by Chan on 2022/09/20.
//
//	https://www.acmicpc.net/problem/1323
//	MARK: - 수학 / 정수론 / 비둘기집 원리
import Foundation

var l = readLine()!.split(separator: " ").map{Int(String($0))!}
var (n, k) = (l[0], l[1])
var check = Array(repeating: false, count: 100001)
var count = 1
var remainder = n % k
var flag = true
var digit = makeDigit(n)

func makeDigit(_ n: Int) -> Int {
	var n = n
	var digit = 0
	while (n > 0) {
		digit += 1
		n /= 10
	}
	digit = Int(pow(10.0, Double(digit)))
	return digit
}

while (remainder != 0) {
	remainder = (remainder*digit + n) % k
	if check[remainder] {
		flag = false
		break
	}
	check[remainder] = true
	count += 1
}

if flag {
	print(count)
} else {
	print(-1)
}
