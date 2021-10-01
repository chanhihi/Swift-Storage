//
//  4344_평균은_넘겠지.swift
//  
//
//  Created by Chan on 2021/10/02.
//
// https://www.acmicpc.net/problem/4344

import Foundation

let n = Int(readLine()!)!

for _ in 0..<n{
    var over = 0
    var arr = readLine()!.split(separator: " ").map { Int(String($0))!}
    var studentNumber = arr[0]
    arr.removeFirst()
    
    for i in 0..<studentNumber{
        if arr[i] > arr.reduce(0, { $0 + $1}) / studentNumber{
            over += 1
        }
    }
    print(String(format: "%.3f", Double(over) / Double(studentNumber) * 100),"%",separator: "")
}
