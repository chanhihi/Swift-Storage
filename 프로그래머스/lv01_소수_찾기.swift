//
//  lv01_소수_찾기.swift
//  
//
//  Created by Chan on 2022/06/23.
//
//	https://programmers.co.kr/learn/courses/30/lessons/12921

//	MARK: - 소수 찾기. 효율성 문제. isprimenumber찾을때
//	제곱근으로 곱해주면 시간절약 가능.
func solution(_ n:Int) -> Int {
	var count = 0
	for i in 2...n {
		if isPrimeNumber(i) {
			count += 1
		}
	}
	return count
}

func isPrimeNumber(_ nb: Int) -> Bool {
	var	i = 2

	if (nb <= 1) { return false }
	while (i * i <= nb ) {
		if (nb % i == 0) { return false }
		i+=1
	}
	return true
}
