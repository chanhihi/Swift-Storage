//
//  11053_가장_긴_증가하는_부분_수열.swift
//  
//
//  Created by Chan on 2021/11/19.
//
//  https://www.acmicpc.net/problem/11053

// MARK: - dp배열로 시작하는 최대수 찾기
let N = Int(readLine()!)!
var n = readLine()!.split(separator: " ").map { Int(String($0))!}
var dp = Array(repeating: 1, count: n.count)

for i in 1..<n.count {
    for j in 0..<i {
        if n[j] < n[i] {
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
}

print(dp.max()!)

