//
//  그리디_체육복.swift
//  
//
//  Created by Chan on 2021/12/02.
//
// MARK: - 배열을 사용한 풀이

import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var student = Array(repeating: 1, count: n)
    var result = 0
    
    for j in 0..<reserve.count {
        student[reserve[j]-1] += 1
    }
    
    for i in 0..<lost.count {
        student[lost[i]-1] -= 1
    }
    
    for i in 0..<n {
        if student[i] == 0 {
            if (i-1) >= 0 && student[i-1] == 2 {
                student[i-1] -= 1
                student[i] += 1
            } else if (i+1) < n && student[i+1] == 2  {
                student[i+1] -= 1
                student[i] += 1
            }
        }
    }
    
    student.forEach {
        if $0 > 0 {
            result += 1
        }
    }
    
    return result
}
