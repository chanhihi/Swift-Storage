//
//  10250_ACM_호텔.swift
//  
//
//  Created by Chan on 2021/10/16.
//  https://www.acmicpc.net/problem/10250
    

// MARK: -
let T = 2 // Int(readLine()!)!

//for i in 1...T {
//
//}

var n = "30 50 90".split(separator: " ").map { Int($0) }
var (H, W, N) = (n[0]!, n[1]!, n[2]!)
var output = ""
W = (N / H) + 1
var d = N % H
if d == 0 { H = N / H }
else { H = d }

output.append(String(H))
output.append(String("0"))
output.append(String(W))

print(output)


// MARK: - 다시 풀어보기

import Foundation

let num = Int(readLine()!)!

for _ in 1...num{
    let testCase = readLine()!.components(separatedBy: " ").map{Double($0)!}
    let share = ceil(testCase[2] / testCase[0])
    var remainder = Int(testCase[2]) % Int(testCase[0])
    if remainder == 0 {
        remainder = Int(testCase[0])
    }
    let result = remainder * 100 + Int(share)
    print(result)
}
