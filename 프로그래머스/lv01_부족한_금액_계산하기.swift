//
//  부족한_금액_계산하기.swift
//
//
//  Created by Chan on 2021/12/12.
//
//	https://programmers.co.kr/learn/courses/30/lessons/82612

// 재풀이
// MARK: - 부족한 금액 계산하기

import Foundation

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64{
	var answer:Int64 = 0
	var pay = 0
	
	for i in 1...count {
		pay += i * price
	}
	
	if money - pay < 0 { answer = Int64(abs(money - pay)) }
//	if money - pay < 0 { answer = Int64((money - pay).magnitude) } // abs == magnitude

	return answer
}

solution(3,	20,	4) //10
