//
//  9461_파도반_수열.swift
//  
//
//  Created by Chan on 2021/11/26.
//
//  https://www.acmicpc.net/problem/9461

let MAX_N = 100
var P: [Int] = Array(repeating: 1, count: MAX_N + 1)
Array(4...MAX_N).forEach {
    P[$0] = P[$0-2] + P[$0-3]
}
let T = Int(String(readLine()!))!
for _ in 0..<T {
    let N = Int(String(readLine()!))!
    print(P[N])
}
