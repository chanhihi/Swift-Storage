//
//  1546_평균.swift
//  
//
//  Created by Chan on 2021/09/13.
//
var n = readLine()! // Unused
var arr = readLine()!.split(separator: " ").map { Double(String ($0))!} // String -> Double
 
var M = arr.max()

for i in 0...arr.count - 1 {
    arr[i] = arr[i] * 100 / M!
}

print(average(arr))

func average(_ arr:[Double]) -> Double { // array average
    let sum = arr.reduce(0, { $0 + $1})
    return Double(sum)/Double(arr.count)
}

