//
//  lv01_최대공약수와_최소공배수.swift
//  
//
//  Created by Chan on 2022/06/26.
//
//	https://programmers.co.kr/learn/courses/30/lessons/12940

func solution(_ n:Int, _ m:Int) -> [Int] {
	var result = [Int]()
	let (n, m) = (min(n, m), max(n, m))
	var i = m
	result.append(gcd(n, m))
	result.append(lcm(n, m))
	return result
}

// MARK: - 1. 유클리드 알고리즘(Euclidean algorithm)
func gcd(_ n: Int, _ m: Int) -> Int {	// greatest common divisor
	var c = 0
	var n = n
	var m = m
	
	while m != 0 {
		c = n % m
		n = m
		m = c
	}
	return n
}

func lcm(_ n: Int, _ m: Int) -> Int {	// lowest common multiple
	return n * m / gcd(n, m)
}

solution(3,	12)//	[3, 12]
solution(2,	5)//	[1, 10]
