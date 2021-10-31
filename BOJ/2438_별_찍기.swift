//
//  2438_별_찍기.swift
//  
//
//  Created by Chan on 2021/10/30.
//
//https://www.acmicpc.net/problem/2438


// MARK: - string repeating 사용
let a = Int(readLine()!)!
for i in (1...a) {
    print(String(repeating: "*", count: i))
}

// MARK: - string type append 사용
let a = Int(readLine()!)!
var r = ""
for _ in 1...a{
    r.append("*")
    print(r)
}

// MARK: - 2중 for문으로 구현
let a = Int(readLine()!)!
for i in 1...a{
    for _ in 1...i{
        print("*", terminator: "")
    }
    print()
}

