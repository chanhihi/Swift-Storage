//
//  나머지가_1이_되는_수_찾기.swift
//  
//
//  Created by Chan on 2021/12/12.
//
//	https://programmers.co.kr/learn/courses/30/lessons/87389?language=swift

// MARK: - 나머지가 1이 되는 수 찾기

import Foundation

func solution(_ n:Int) -> Int {
    for i in 2...1000000{
        if n % i == 1 {
            return i
        }
    }
    return n-1
}
