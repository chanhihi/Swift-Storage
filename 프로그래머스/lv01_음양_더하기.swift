//
//  음양_더하기.swift
//  
//
//  Created by Chan on 2022/04/26.
//
//

import Foundation

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    var result: Int = 0
    
    for i in 0...absolutes.count - 1 {
        if signs[i] {
            result = result + absolutes[i]
        } else {
            result = result - absolutes[i]
        }
    }
    return result
}
