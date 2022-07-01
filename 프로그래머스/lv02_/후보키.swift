//
//  후보키.swift
//  swift_practise
//
//  Created by Chan on 2022/07/02.
//
//	https://programmers.co.kr/learn/courses/30/lessons/42890
//	조합 / combi / 유일
import Foundation

var numArr: [[Int]] = [] // 조합으로 구한 경우의 수
func solution(_ relation:[[String]]) -> Int {
	// 1. 컬럼이 짝 지을 수 있는 경우의 수 다 구해주기
	for i in 0..<relation[0].count{
		combination(i, relation[0].count, [])
	}
	
	// 2
	numArr.sort{ $0.count < $1.count}
	
	var i = 0
	while i < numArr.count{
		var arr: [String] = []
		// 3. 컬럼이 유일한지 판별해줍니다.
		for m in relation.indices{
			var k = ""
			for n in numArr[i].indices{
				k += relation[m][numArr[i][n]]
			}
			if arr.contains(k){ // contain을 사용하여 유일한지 체크
				break // 포함하고 있다면 break
			}else{ // 포함하지 않는다면 append
				arr.append(k)
			}
		}
		
		// 4
		if arr.count == relation.count{ // arr과 튜플의 수가 같을 때 즉 다 유일할 때
			var c = 0
			
			while c < numArr.count{
				var cnt = 0
				for l in numArr[i].indices{ // 해당 컬럼을 가지고 있는지 체크
					if numArr[c].contains(numArr[i][l]){
						cnt += 1
					}
				}
			   
				if numArr[i] != numArr[c] && cnt == numArr[i].count{ // 만약 다 가지고 있다면
					numArr.remove(at: c) // 제거
				}else{
					c += 1
				}
			}
			i += 1
		}else{ // 유일하지 않다면 제거
			numArr.remove(at: i)
		}
	}
	
	return numArr.count
}
// 조합
func combination(_ s: Int, _ cnt: Int, _ arr: [Int]){
	if s == cnt {
		numArr.append(arr)
		return
	}else {
		var arr = arr
		for i in s..<cnt{
			arr.append(s)
			combination(i + 1, cnt, arr)
			arr.removeLast()
		}
	}
}
