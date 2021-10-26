//
//  4948_베르트랑_공준.swift
//  
//
//  Created by Chan on 2021/10/26.
//
//https://www.acmicpc.net/problem/4948

while true {
    var M = Int(readLine()!)!
    if M == 0 { break }
    var N = M*2
    var result = 0
    var arr: [Int] = Array(repeating: 0, count: N + 1)

    for i in 2...N {
        arr[i] = i
    }

    for j in 2...N {
        if arr[j] == 0 {continue}
        for k in stride(from: j + j, through: N, by: j) {
            arr[k] = 0
        }
    }

    arr.forEach {
        if $0 > M {
            result += 1
        }
    }
    print(result)
}

