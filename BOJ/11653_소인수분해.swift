//
//  11653_소인수분해.swift
//  
//
//  Created by Chan on 2021/10/23.
//
//    https://www.acmicpc.net/problem/11653

var N = Int(String(readLine()!))!
if N == 1 {
    print("")
}
for i in stride(from: 2, through: N, by: 1) {
    while N % i == 0 {
        print("\(i)")
        N = N / i
    }
}
