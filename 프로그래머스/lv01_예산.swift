//
//  예산.swift
//  
//
//  Created by Chan on 2021/12/11.
//
//	https://programmers.co.kr/learn/courses/30/lessons/12982

// 재 풀이 : 주석

// MARK: - 예산

import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {		// 가장 많은 부서에 예산을 집행해주기.
    var dSort = d.sorted()							// 정렬
    var bt = budget									// 예산 설정
    var count = 0									// 가장 많은 부서 카운트
    for i in 0..<dSort.count {						// 집행
        bt -= dSort[i]								// 처리된 부서 예산 처리
        if bt < 0 {									// 카운트 전에 할 수 있는지 없는지 처리.
            break
        }
        count += 1
    }
    return count
}
