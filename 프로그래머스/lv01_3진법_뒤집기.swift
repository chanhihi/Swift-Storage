//
//  3진법_뒤집기.swift
//  
//
//  Created by Chan on 2021/12/10.
//
//	https://programmers.co.kr/learn/courses/30/lessons/68935

// MARK: - 3진법 뒤집기

import Foundation

func solution(_ n:Int) -> Int {
    let three = String(n, radix: 3)					// 3진법변환
    let threeReversed = String(three.reversed())	// 뒤집기
    return Int(threeReversed, radix: 3)!			// 10진법 변환
}
