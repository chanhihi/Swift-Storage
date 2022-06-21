//
//  배열_2차원_배열에서_인덱스_찾기.swift
//  
//
//  Created by Chan on 2021/12/03.
//

import Foundation

var numberArray = [[0,1,2,3,4,5],[6,7,8,9,10],[11,12,13,14,15]]

for i in 0..<numberArray.count {
    for idx in 0..<numberArray[i].count {
        if numberArray[i][idx] == 10 {

            print(i, idx)
        }
    }
}

for i in 0..<numberArray.count {
    if let index = numberArray[i].firstIndex(of: 10) {
        print(i, index)
    }
}
