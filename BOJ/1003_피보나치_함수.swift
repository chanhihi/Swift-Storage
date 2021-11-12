//
//  1003_피보나치_함수.swift
//  
//
//  Created by Chan on 2021/11/12.
//
//  https://www.acmicpc.net/problem/1003

var dp1: [Int] = [Int](repeating: 1, count: 41)
var dp2: [Int] = [Int](repeating: 1, count: 41)

dp1[1] = 0
dp2[0] = 0

//  dp1 = [1,0,1,1,2,3,5,...]
//  dp2 = [0,1,1,2,3,5,8,...]

for i in 4...40 {
    dp1[i] = dp1[i-1] + dp1[i-2]
    dp2[i] = dp2[i-1] + dp2[i-2]
}

let T = Int(readLine()!)!

for _ in 1...T {
    let N = Int(readLine()!)!
    print(dp1[N], dp2[N])
}
