//
//  선택 정렬.swift
//  algorithms
//
//  Created by 김찬희 on 2023/09/27.
//

var a = [7, 5, 9, 0, 3, 1, 6, 2, 4, 8]

for i in 1..<a.count {
    for j in stride(from: i, to: 0, by: -1) {
        if a[j] < a[j - 1] {
            a.swapAt(j, j - 1)
        } else {
            break
        }
    }
}

print(a)
