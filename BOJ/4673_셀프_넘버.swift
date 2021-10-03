//
//  4673_셀프_넘버.swift
//  
//
//  Created by Chan on 2021/10/03.
//
// https://www.acmicpc.net/problem/4673

import Foundation

var arr = [Int](repeating: 0, count: 10000)

func condition(n: temp) -> Int {
    var result = n
    var temp = n
    
    while temp != 0 {
        result += temp % 10
        temp = temp / 10
    }
    return result
}

for i in 1..<10000 {
    var temp = i
    while true {
        temp = condition(n: temp)
        if temp >= 10000 { break }
        arr[temp] = arr[temp] + 1
    }
}

for i in 1..<10000 {
    if arr[i] == 0 {
        print(i)
    }
}
