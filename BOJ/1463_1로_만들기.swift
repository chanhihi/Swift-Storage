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


// MARK: - dp 초기값 1,2,3

let n = Int(readLine()!)!
if n == 1 { print(0) }
else if n == 2 { print(1) }
else if n == 3 { print(1) }
else {
    var dp: [Int] = [Int](repeating: 0, count: n+1)
    dp[1] = 0
    dp[2] = 1
    dp[3] = 1
    for i in 4...n{
        if i % 3 == 0 {
            dp[i] = min(dp[i-1] + 1, dp[i/3] + 1)
        } else if i % 2 == 0{
            dp[i] = min(dp[i-1] + 1, dp[i/2] + 1) }
        else { dp[i] = dp[i-1] + 1 }
        }
    print(dp[n])
}
