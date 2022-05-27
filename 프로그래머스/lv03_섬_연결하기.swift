//
//  그리디_3_섬_연결하기.swift
//
//
//  Created by Chan on 2021/12/03.
//
//	https://programmers.co.kr/learn/courses/30/lessons/42861

// 재 풀이: 주석
// MARK: - 그리디_3_섬_연결하기
import Foundation

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
	var result = 0
	let costArray = costs.sorted { $0[2] < $1[2] }	// 비용으로 정렬.
	var arr = [[Int]]()
	
	for i in 0..<n {
		arr.append([i])
	}
	
	print(arr)
	print("costArray", costArray)

	var idx1 = 0
	var idx2 = 0

	for cost in costArray {
		for i in 0..<arr.count {
//			if let firstIdx = arr[i].firstIndex(of: cost[0]) { idx1 = i }
//   		if let secondIdx = arr[i].firstIndex(of: cost[1]) { idx2 = i }	// 닐 가드.
			if arr[i].firstIndex(of: cost[0]) != nil { idx1 = i }	// 정렬을 했으니 가장 앞에 있는 인덱스가 제일 작은것
			if arr[i].firstIndex(of: cost[1]) != nil { idx2 = i }
		}
//        print("d1",arr[idx1])
//        print("d2",arr[idx2])
//        print(result)

		if idx1 != idx2 {	// 합쳐지지 않았을때.
			result += cost[2]		// 비용 합침. (방문)
			arr[idx1] += arr[idx2]	// 합침. (방문)
			arr.remove(at: idx2)	// 방문한 녀석 삭제.
		}
		if arr.count == 0 {
			break
		}
	}
//    print(arr)
	return result
}

//var N = 4
//var COSTS = [[0,1,1],[0,2,2],[1,2,5],[1,3,1],[2,3,8]]
//var RESULT = 4
//
//N = 4
//COSTS = [[0,1,1],[1,2,1],[2,0,1],[3,0,2]]
//RESULT = 4
//
//print("solution", solution(N, COSTS))
//print(RESULT)

solution(4,[[0,1,1],[0,2,2],[1,2,5],[1,3,1],[2,3,8]])	//4
