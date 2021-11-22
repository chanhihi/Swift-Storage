//
//  11722_가장_긴_감소하는_부분_수열.swift
//  
//
//  Created by Chan on 2021/11/21.
//
//  https://www.acmicpc.net/problem/11722


// MARK: - stride(감소) 변경
let N = Int(readLine()!)!
var n = readLine()!.split(separator: " ").map { Int(String($0))!}
var dp = Array(repeating: 1, count: n.count)

for i in stride(from: n.count - 1, through: 0, by: -1){
    for j in stride(from: n.count - 1, through: i, by: -1){
        if n[j] < n[i]{
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
}

print(dp.max()!)

// MARK: - if문 변경 > 정답
let N = Int(readLine()!)!
var n = readLine()!.split(separator: " ").map { Int(String($0))!}
var dp = Array(repeating: 1, count: n.count)

for i in 1..<n.count {
    for j in 0..<i {
        if n[j] > n[i] {
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
}

print(dp.max()!)
