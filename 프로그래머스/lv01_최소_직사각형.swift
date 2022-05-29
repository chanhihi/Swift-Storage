//
//  최소_직사각형.swift
//
//
//  Created by Chan on 2021/12/11.
//
//	https://programmers.co.kr/learn/courses/30/lessons/86491

// 재풀이: 주석
// MARK: - 최소 직사각형

import Foundation

func solution(_ sizes:[[Int]]) -> Int {
	var x = 0
	var y = 0
	var size = sizes
	for i in 0..<size.count {		// 해당하는 사이즈들 x,y값 정렬을 통해 가로로 넣을지 세로로 넣을지 정함.
		size[i].sort()
		x = max(size[i][0],x)
		y = max(size[i][1],y)
	}
	
	return x * y
}

solution ([[60, 50], [30, 70], [60, 30], [80, 40]])//	4000
solution ([[10, 7], [12, 3], [8, 15], [14, 7], [5, 15]]	)//120
solution ([[14, 4], [19, 6], [6, 16], [18, 7], [7, 11]]	)//133
