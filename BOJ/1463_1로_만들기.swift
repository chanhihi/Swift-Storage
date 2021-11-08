//
//  1463_1로_만들기.swift
//  
//
//  Created by Chan on 2021/11/03.
//
//  https://www.acmicpc.net/problem/1463

// MARK: - dp

var n = Int(readLine()!)!
var dp = [Int](repeating: 0, count: n+1)
for i in 2..<n+1 {
    dp[i] = dp[i-1] + 1
    if i % 3==0 { dp[i] = min(dp[i], dp[i/3]+1) }
    if i % 2==0 { dp[i] = min(dp[i], dp[i/2]+1) }
}
print(n==1 ? 0 : dp[n])
