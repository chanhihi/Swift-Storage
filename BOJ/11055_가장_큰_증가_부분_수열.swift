//
//  11055_가장_큰_증가_부분_수열.swift
//  
//
//  Created by Chan on 2021/11/20.
//
//  https://www.acmicpc.net/problem/11055

// MARK: - 이전 dp + 가장 큰수 합
let N = Int(readLine()!)!
var n = readLine()!.split(separator: " ").map { Int(String($0))!}
var dp = [0]

n.forEach() {
    dp.append($0)
}

func solution() -> Int {
    for i in 1...n.count{
        for j in 1...i{
            if n[i - 1] > n[j - 1] {
                dp[i] = max(dp[j] + n[i - 1], dp[i])
            }
        }
    }
    return dp.max()!
}

print(solution())

