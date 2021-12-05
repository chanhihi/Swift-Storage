//
//  재귀_모든_경우의_수.swift
//  
//
//  Created by Chan on 2021/12/05.
//

//MARK: - 재귀, 모든 경우의 수 찾기

import Foundation

let A = [1, 2, 3, 4, 5]
var count = 0

func cycle(_ i: Int, _ array: [Int]) {
    count += 1
    print("count: ",count)
    var mutableArray = array
    mutableArray.append(A[i])
    
    print(mutableArray)
    print("i: ", i)
    
    if i >= A.count - 1 {
        print("return")
        return
    }
    
    print("before j")
    
    for j in i+1...4 {
        print("j: ",j)
        cycle(j, mutableArray)
    }
    
    print("func end")
}

for k in 0...4 {
    print("k: ", k)
    cycle(k, [])
}

