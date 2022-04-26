//
//  내적.swift
//  
//
//  Created by Chan on 2022/04/26.
//
//
//

import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    var result: Int = 0
    
    for i in 0...a.count-1 {
        result += a[i]*b[i]
    }
    
    return result
}

let N = [1,2,3,4]
let SIGNS = [-3,-1,0,2]

print(solution(N, SIGNS))
print(3)
