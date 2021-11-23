//
//  2579_계단_오르기.swift
//  
//
//  Created by Chan on 2021/11/23.
//
//  https://www.acmicpc.net/problem/2579

let a = Int(readLine()!)!
var dp = [Int]()
var output = Array(repeating: 0, count: a)

for _ in 0..<a {
    dp.append(Int(String(readLine()!))!)
}

func solution() -> Int {
    if a == 1 {
        return dp[0]
    } else if a == 2 {
        return dp[0] + dp[1]
    } else if a == 3 {
        return max(dp[0] + dp[2], dp[1] + dp[2])
    } else {
        output[0] = dp[0]
        output[1] = dp[0] + dp[1]
        output[2] = max(dp[0] + dp[2], dp[1] + dp[2])
    }
    
    for i in 3..<dp.count{
        output[i] = max(dp[i] + output[i-2], dp[i] + dp[i-1] + output[i-3])
    }
    
    return output[output.count-1]
}

print(solution())

