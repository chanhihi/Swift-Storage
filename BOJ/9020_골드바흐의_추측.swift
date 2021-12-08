//
//  9020_골드바흐의_추측.swift
//  
//
//  Created by Chan on 2021/12/09.
//
//  https://www.acmicpc.net/problem/9020

let testCase = 10000
var numArray = Array(repeating: true, count: testCase+1)

for i in 2...testCase {
    if numArray[i] == false { continue }
    
    for j in stride(from: i+i, through: testCase, by: i) {
        numArray[j] = false
    }
}

let t = Int(readLine()!)!

for _ in 0..<t {
    let n = Int(readLine()!)!
    goldbach(n,n/2,n/2)
}

func goldbach(_ a: Int, _ b: Int, _ c: Int) {
    if a < 4 || a > 10000 || a % 2 != 0 {
        return
    } else {
        if numArray[b] == true && numArray[c] == true {
            print(b, c)
        } else {
            goldbach(a, b - 1, c + 1)
        }
    }
}
