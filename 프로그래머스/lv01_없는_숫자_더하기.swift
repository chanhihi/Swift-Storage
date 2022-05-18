//
//  없는_숫자_더하기.swift
//  
//
//  Created by Chan on 2022/04/26.
//
import Foundation

func solution(_ numbers:[Int]) -> Int {
    let O = [1,2,3,4,5,6,7,8,9]
    var result = 45
    
    O.forEach {
        if numbers.contains($0) {
            result = result - $0
        }
    }
    
    return result
}

let N = [1,2,3,4,6,7,8,0]

//let N = [[5,8,4,0,6,7,9] 6
print(solution(N))
print(14)
