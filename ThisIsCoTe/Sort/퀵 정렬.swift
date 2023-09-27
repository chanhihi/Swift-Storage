//
//  퀵 정렬.swift
//  algorithms
//
//  Created by 김찬희 on 2023/09/27.
//

var a = [5, 7, 9, 0, 3, 1, 6, 2, 4, 8]

func quickSort(_ array: [Int]) -> [Int] {
    if array.count <= 1 {
        return array
    }
        
    let pivot = array[0]
    let tail = array[1...]
    
    let leftSide = tail.filter { $0 <= pivot }
    let rightSide = tail.filter { $0 > pivot }

    return quickSort(leftSide) + [pivot] + quickSort(rightSide)
}

print(quickSort(a))
