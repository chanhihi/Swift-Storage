//
//  H-index.swift
//  swift_practise
//
//  Created by Chan on 2022/07/02.
//
//	https://programmers.co.kr/learn/courses/30/lessons/42747
//	MARK: - 수학 / 정렬
import Foundation

func solution(_ citations:[Int]) -> Int {
	var h = -1
	for (i,v) in citations.sorted(by: >).enumerated() {
		if i+1 > v {
			h = i
			break
		}
	}
	if h == -1 {
		return citations.count
	}
	return h
}
