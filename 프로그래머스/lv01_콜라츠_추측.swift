//
//  lv01_콜라츠_추측.swift
//
//
//  Created by Chan on 2022/06/26.
//
//	https://programmers.co.kr/learn/courses/30/lessons/12943

func solution(_ num:Int) -> Int {
	var count = 0
	var num = num
	
	while (num != 1) {
		if count == 500 {
			return -1
		}
		count += 1
		num = (num % 2 == 0 ? num / 2 : (num * 3) + 1)
	}
	return count
}

solution(626331)
