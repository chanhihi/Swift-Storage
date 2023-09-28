//
//  계수 정렬.swift
//  algorithms
//
//  Created by 김찬희 on 2023/09/28.
//

var a = [5, 7, 9, 0, 3, 1, 6, 2, 4, 8, 0, 5, 2, 6, 8]

func countSort(_ array: [Int]) -> [Int] {
    if array.count <= 1 {
        return array
    }
    
    var sortStorage = Array(repeating: 0, count: array.max()! + 1)
    for v in array {
        sortStorage[v] += 1
    }
    
    var s = [Int]()
    
    for (i, v) in sortStorage.enumerated() {
        for _ in 0..<v {
            s.append(i)
        }
    }
    
    return s
}

print(countSort(a))
