//
//  예산.swift
//  
//
//  Created by Chan on 2021/12/11.
//

// MARK: - 예산

import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
    var dSort = d.sorted()
    var bt = budget
    var count = 0
    for i in 0..<dSort.count {
        bt -= dSort[i]
        if bt < 0 {
            break
        }
        count += 1
    }
    return count
}
