//
//  lv02_문자열_압축.swift
//  
//
//  Created by Chan on 2022/05/15.
//
//	https://programmers.co.kr/learn/courses/30/lessons/60057

// MARK: - 재풀이.
/// 문자열처리 parsing 과정에서의 string을 array로 처리하면서 indexing 관리
import Foundation

func solution(_ s:String) -> Int {
	let str = s.map { String($0) }	// 문자열을 배열로 파싱
	let strLength = str.count
	var minLength = strLength
	let cutMaxSize = strLength / 2	// 최대로 잘릴수 있는 사이즈
	for size in (0..<cutMaxSize).reversed() {	// 자를수 있는 갯수대로 다 잘라봄
		let cutSize = size + 1		// 자를 수 있는 갯수는 1 ~ cutMaxSize
		var count = -1				// 잘리는 갯수가 1 개일 경우 대비
		var checkStr = [String](str[0..<cutSize])	// 비교해야 하는 str 배열
		var result = [String]()
		for index in (0..<strLength / cutSize) {	// 확인할 인덱스들 (offset 처리)
			let startIndex = index * cutSize		// offset 처리 부분
			let current = [String](str[startIndex..<startIndex + cutSize])	// 비교해야 할 부분
			if current == checkStr {		// 비교가 같다면
				count += 1
				checkStr = current
			} else {						// 비교가 다르다면
				if count == 0 {				// 잘리는 갯수가 1개일 경우 1로 숫자를 적지 않음. 1로 잘리는게 default
					result += checkStr
					checkStr = current
				} else {					// 잘리는 갯수가
					result += String(count + 1).map { String($0) }
					result += checkStr
					count = 0
					checkStr = current
				}
			}
		}
		// for문을 돌때 마지막 오프셋이 붙지 않고 나와짐
		if count != 0 {				// 비교가 같은 채로 나와버린 경우
			result += String(count + 1).map { String($0) }
		}
		result += checkStr
		let remains = str[(str.count / cutSize * cutSize)...] 	// 해당 마지막 오프셋
		result += remains										// 남아있는 애들 배열에 붙혀줌.
		minLength = min(minLength, result.count)				// 작은수 찾기.
	}
	return minLength
}
