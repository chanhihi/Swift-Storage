//
//  배열_2차원_배열_찾아서_합치기.swift
//  
//
//  Created by Chan on 2021/12/03.
//

import Foundation

var nuArray = [[0,1],[2,3],[4,5]]
var coke = [0,4,1]

let find0 = coke[0]
let find1 = coke[1]

var firstIdx = -1
var lastIdx = -1

for i in 0..<nuArray.count {
    if let index0 = nuArray[i].firstIndex(of: find0) { firstIdx = i }
    if let index1 = nuArray[i].firstIndex(of: find1) { lastIdx = i }
}

for i in 0..<nuArray.count {
    if nuArray[i].contains(find0) { firstIdx = i }
    if let index1 = nuArray[i].firstIndex(of: find1) { lastIdx = i }

    if (firstIdx > 0 && lastIdx > 0) {
        break
    }
}

nuArray[firstIdx] = nuArray[firstIdx] + nuArray[lastIdx]
nuArray.remove(at: lastIdx)

print(nuArray)
