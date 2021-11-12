//
//  11057_오르막_수.swift
//  
//
//  Created by Chan on 2021/11/12.
//
//  https://www.acmicpc.net/problem/11057

let n = Int(readLine()!)!
var dp = Array(repeating: Array(repeating: 1, count: 10), count: 1001)
var sum = 0
var mod = 10007

for i in 2...1000 {
    for j in 0...9 {
        if j != 0 {
            dp[i][j] = (dp[i-1][j] + dp[i][j-1]) % mod
        }
    }
}

for i in 0...9 {
    sum += dp[n][i]
}

print(sum % mod)
