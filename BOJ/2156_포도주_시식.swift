//
//  2156_포도주_시식.swift
//  
//
//  Created by Chan on 2021/11/18.
//
//  https://www.acmicpc.net/problem/2156


// MARK: - dp[i-2] + input[i], dp[i-3] + input[i] + input[i-1], dp[i-1] 

let n = Int(readLine()!)!
var input = [0]
var dp = Array(repeating: 0, count: n+1)
for _ in 1...n {
    input.append(Int(readLine()!)!)
}

dp[1] = input[1]
if n >= 2 {
    dp[2] = input[1] + input[2]
}

for i in stride(from: 3, through: n, by: 1) {
    dp[i] = max(dp[i - 2] + input[i], dp[i - 3] + input[i] + input[i - 1], dp[i - 1])
}

print(dp[n])
