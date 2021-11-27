//
//  두개_뽑아서_더하기.swift
//  
//
//  Created by Chan on 2021/11/28.
//

//   MARK: - 두개 뽑아서 더하기

import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var result: Set<Int> = []
    
    for i in 0..<numbers.count {
        for j in i+1..<numbers.count {
            result.insert(numbers[i]+numbers[j])
        }
    }
    
    return Array(result.sorted(by: <))
}
