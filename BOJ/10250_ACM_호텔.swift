//
//  10250_ACM_호텔.swift
//  
//
//  Created by Chan on 2021/10/16.
//  https://www.acmicpc.net/problem/10250
    

// MARK: -
let T = Int(readLine()!)!

for _ in 1...T {
    var n = readLine()!.split(separator: " ").map { Double($0)! }
    var (H, W, N) = (n[0], n[1], n[2])
    W = ceil(N / H)
    var d = Int(N) % Int(H)
    if d != 0 { H = Double(d) }
    var output = Int(H * 100) + Int(W)
    print(output)
}
