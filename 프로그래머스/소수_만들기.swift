//
//  소수_만들기.swift
//  
//
//  Created by Chan on 2021/12/01.
//
// MARK: - 에라토스테네스의 체로 걸러서 해당하는 값만 사용

import Foundation

func solution(_ nums:[Int]) -> Int {
    var answer = 0
    let num = 3000
    var numArray = Array(repeating: 0, count: num + 1)
    var sum = 0

    
    for i in 2...num {
        numArray[i] = i
    }

    for i in 2...num {
        if numArray[i] == 0 {
            continue
        }
        
        for j in stride(from: i+i, through: num, by: i) {
            numArray[j] = 0;
        }
    }
    numArray.removeAll(where: { $0 == 0 })
//    print(numArray)
    
    for i in 0..<nums.count-2 {
        for j in i+1..<nums.count-1 {
            for k in j+1..<nums.count {
                sum = nums[i] + nums[j] + nums[k]
                if numArray.contains(sum) {
                    answer += 1
                }
            }
        }
    }

    return answer
}

let NUMBS = [1,2,3,4]

print(solution(NUMBS))
print(1)
