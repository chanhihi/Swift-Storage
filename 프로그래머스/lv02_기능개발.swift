//
//  lv02_기능개발.swift
//
//
//  Created by Chan on 2022/05/19.
//
//	https://programmers.co.kr/learn/courses/30/lessons/42586?language=swift

// MARK: - 재풀이: 스택구조에 대해서 확인 할 것.

import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
	var remainProgresses = Array(repeating: 100, count: progresses.count)
	var completeDate = Array(repeating: 0, count: progresses.count)
	var release = [Int]()
	var releaseCount = [Int]()
	
	for i in 0..<progresses.count {
		remainProgresses[i] = remainProgresses[i] - progresses[i]
		completeDate[i] = Int(ceil(Double(remainProgresses[i]) / Double(speeds[i])))	// 완성되는 날짜
	}
	release.append(completeDate[0])

	for i in 1..<completeDate.count {	// 완성 날짜들 돌면서 release 정리
		if !release.isEmpty {
			if release.first! < completeDate[i] {	// completeDate[0] 스택 구조로 뒤에오는 value 정렬
				releaseCount.append(release.count)
				release.removeAll()
				release.append(completeDate[i])
			} else {
				release.append(completeDate[i])
			}
		} else {
			release.append(completeDate[i])
		}
		
		if i == completeDate.count - 1 {	// 해당 release의 갯수대로 append
			if !release.isEmpty {
				releaseCount.append(release.count)
			}
		}
	}
	return releaseCount
}
