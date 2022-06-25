//
//  lv01_약수의_합.swift
//  
//
//  Created by Chan on 2022/06/25.
//
//	https://programmers.co.kr/learn/courses/30/lessons/12928

//	MARK: - 기본 reduce와 filter 짚고 넘어가기

func solution(_ n:Int) -> Int {
	if n == 0 { return 0 }
	if n == 1 { return 1 }
	var sum = 0
	for i in 1...n/2 {
		if n % i == 0 {
			sum += i
		}
	}
	return sum + n
}

func solution_filter(_ n:Int) -> Int {
	return n != 0 ? Array(1...n).filter{n % $0 == 0}.reduce(0, +) : 0
}

func solution_reduce(_ n:Int) -> Int {
	return n != 0 ? (1...n).filter{n % $0 == 0}.reduce(0){$0 + $1} : 0
}
