//
//  1912_연속합.swift
//  
//
//  Created by Chan on 2021/11/22.
//
//  https://www.acmicpc.net/problem/1912

let N = Int(readLine()!)!
var n = readLine()!.split(separator: " ").map { Int(String($0))!}
var output = 0
var now = 0

func solution() -> Int {
    if n.max()! < 0 {
        return n.max()!
    }
    n.forEach() {
        now += $0
        if now < 0 {
            now = 0
        }
        if output < now {
            output = now
        }
    }
    return output
}
print(solution())

