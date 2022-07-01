//
//  lv02_배달.swift
//  swift_practise
//
//  Created by Chan on 2022/07/01.
//
//	https://programmers.co.kr/learn/courses/30/lessons/12978

// 시간 복잡도 O(n^3) n이 1000일 때? 까지는 괜찮다고 한다.
//	MARK: - 플로이드 와샬 / “Floyd-Warshal 알고리즘” / 다익스트라와 유사
import Foundation

func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
	var costArr = Array(repeating:Array(repeating: 7777777, count: N+1), count: N+1) // 2차원 배열로 최단거리 구함
	var answer = 0
	for i in 0...N {
		costArr[i][i] = 0	// 자기자신으로 가는길은 0이므로
	}
	for i in 0..<road.count {
		if costArr[road[i][0]][road[i][1]] > road[i][2] {	// 길이 2개 이상인경우 최단 거리 값 저장.
			costArr[road[i][0]][road[i][1]] = road[i][2]
			costArr[road[i][1]][road[i][0]] = road[i][2]
		}
	}
	for k in 1...N{
		for i in 1...N{
			for j in 1...N{
				if costArr[i][k] + costArr[k][j] < costArr[i][j] {
					costArr[i][j] = costArr[i][k] + costArr[k][j]	// k를 거쳐갈때 나올 수 있는 값 중 최단거리.
				}
			}
		}
	}
	for i in 1...N{
		if costArr[1][i] <= k{
			answer += 1
		}
	}
	return answer
}
