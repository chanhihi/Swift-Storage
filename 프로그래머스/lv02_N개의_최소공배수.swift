//
//  lv02_N개의_최소공배수.swift
//  swift_practise
//
//  Created by Chan on 2022/06/30.
//
//	https://programmers.co.kr/learn/courses/30/lessons/12953

// MARK: - lcm, gcd, 최소공배수, 최대공약수
func solution(_ arr:[Int]) -> Int {
	var lcmTemp = arr[0]
	
	if arr.count > 1 {
		for i in 1..<arr.count {
			lcmTemp = lcm(lcmTemp, arr[i])
		}
	}
	return lcmTemp
}


func gcd(_ n: Int, _ m: Int) -> Int {
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

func lcm(_ n: Int, _ m: Int) -> Int {
	return n * m / gcd(n, m)
}
