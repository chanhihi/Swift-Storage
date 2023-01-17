//
//  17425_약수의_합.swift
//  swift_practise
//
//  Created by Chan on 2023/01/18.
//
//	https://www.acmicpc.net/problem/17425
//
//	MARK: - 에라토스테네스의 체 / 누적 합

func accumulateSum() -> [Int] {
	var div = Array(repeating: 0, count: 1000001)
	var sum = Array(repeating: 0, count: 1000001)

	for i in 1...1000000 {
		var j = 1
		while i*j <= 1000000 {
			div[i*j] += j
			j += 1
		}
	}
	sum[1] = div[1]
	for i in 2..<div.count {
		sum[i] = sum[i-1] + div[i]
	}

	return sum
}

let accumulate = accumulateSum()
let T = Int(readLine()!)!

for _ in 0..<T {
	let num = Int(readLine()!)!
	print(accumulate[num])
}

