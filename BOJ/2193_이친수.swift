//
//  2193_이친수.swift
//  
//
//  Created by Chan on 2021/11/14.
//
//  https://www.acmicpc.net/problem/2193


// MARK: - Bottom-up(저장)
let n = Int(readLine()!)!
var d: [Int] = [Int](repeating: 0, count: 91)

d[1] = 1
d[2] = 1

for i in 3...90 {
    d[i] = (d[i-1] + d[i-2])
}
print(d[n])

// MARK: - Top-down(재귀)
func dp(x: Int) -> Int {
    if x == 1 {
        return 1
    } else if x == 2 {
        return 1
    } else if d[x] != 0{
        return d[x]
    }
    d[x] = dp(x: x-1) + dp(x: x-2)
    return d[x]
}

print(dp(x: n))

