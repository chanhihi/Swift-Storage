//
//  선택 정렬.swift
//  algorithms
//
//  Created by 김찬희 on 2023/09/26.
//

var a = [7, 5, 9, 0, 3, 1, 6, 2, 4, 8]

for i in 0..<a.count {
    var minIndex = i
    for j in i..<a.count {
        if a[minIndex] > a[j] {
            minIndex = j
        }
    }
    a.swapAt(i, minIndex)
}

print(a)
