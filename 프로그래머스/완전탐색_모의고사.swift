//
//  완전탐색_모의고사.swift
//  
//
//  Created by Chan on 2021/12/01.
//
// MARK: - 1등만 뽑아내는 식
import Foundation

func solution(_ answers:[Int]) -> [Int] {
    let a = [1,2,3,4,5]
    let b = [2,1,2,3,2,4,2,5]
    let c = [3,3,1,1,2,2,4,4,5,5]
    
    var index = 0
    var result: [Int] = [0,0,0]
    var output: [Int] = []
    
    while index <= answers.count - 1 {
        if answers[index] == a[index % 5] {
            result[0] += 1
        }
        if answers[index] == b[index % 8] {
            result[1] += 1
        }
        if answers[index] == c[index % 10] {
            result[2] += 1
        }
        index += 1
    }
    
    print(result)
    
    let maxScore = result.max()
    
    for i in 0..<result.count {
        if result[i] == maxScore {
            output.append(i+1)
        }
    }
    
    // MARK: - 1,2,3 전부 찾아내는 식
//    result = [2,10000,10000]
//    var sort = result.sorted(by: >)
//
//    sort.forEach {
//        let score = $0
//        if score != 0 {
//            if let index = result.firstIndex{ score == $0  } {
//                output.append(index + 1)
//                result[index] = -1
//            }
//        }
//    }
    
    return output
}

//let input = [1,2,3,4,5]
//let input = [1,3,2,4,2]
//let input = [6,6,6,6,6]
let input =  [3,3,1,1,2,2,4,4,5,5]


print(solution(input))
