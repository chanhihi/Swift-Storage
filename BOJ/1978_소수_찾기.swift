//
//  1978_소수_찾기.swift
//  
//
//  Created by Chan on 2021/10/22.
//
//  https://www.acmicpc.net/problem/1978

var N = Int(readLine()!)!
let n = readLine()!.split(separator: " ").map { Int(String($0))! }
var result = 0

func isPrime(num: Int) -> Bool {
    var result: Bool = true
    
    if num < 2 {
        result = false
    }else if num > 2 {
        for i in 2..<num {
            if num%i == 0 {
                result = false
            }
        }
    }
    return result
}

for i in 0...(N-1) {
    if isPrime(num: n[i]) {result += 1}
}

print(result)
