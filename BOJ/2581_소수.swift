//
//  2581_소수.swift
//  
//
//  Created by Chan on 2021/10/22.
//
//    https://www.acmicpc.net/problem/2581
var M = Int(readLine()!)!
var N = Int(readLine()!)!
var SUM = 0
var MIN = -1

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

for i in M...N {
    if isPrime(num: i) {
        SUM += i
        if MIN < 0 {MIN = i}
    }
}

if SUM > 0 {print(SUM)}
print(MIN)

