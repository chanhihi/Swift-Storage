//
//  2839_설탕_배달.swift
//  
//
//  Created by Chan on 2021/10/27.
//
//https://www.acmicpc.net/problem/2839

var N = Int(readLine()!)!
var result = 0

if N % 5 == 0 {
    result = N/5
} else {
    while (N >= 0) {
        N -= 3
        result += 1
        if N % 5 == 0 {
            result += N/5
            break
        }
    }
}

if N < 0 { print(-1) }
else { print(result) }
