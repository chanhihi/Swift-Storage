//
//  lv01_하샤드_수.swift
//  
//
//  Created by Chan on 2022/06/26.
//
//	https://programmers.co.kr/learn/courses/30/lessons/12947

func solution(_ x:Int) -> Bool {
	var z = x
	var h = 0
	while (z != 0) {
		h += z % 10
		z /= 10
	}
	if x % h == 0 {
		return true
	} else {
		return false
	}
}
