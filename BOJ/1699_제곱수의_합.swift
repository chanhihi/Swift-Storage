//
//  1699_제곱수의_합.swift
//  
//
//  Created by Chan on 2021/11/24.
//
//  https://www.acmicpc.net/problem/1699

let n = Int(String(readLine()!))!

var dp: [Int] = Array(repeating: 0,count: 100001)

for i in stride(from: 1,through: n,by: 1){
        dp[i] = i
        for j in stride(from: 1, through: i, by: 1) {
            if j * j > i {
                break
            }
            dp[i] = min(dp[i], dp[i - j * j] + 1)
    }
}
print(dp[n])
