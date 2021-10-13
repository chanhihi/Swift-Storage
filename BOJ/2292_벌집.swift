//
//  2292_벌집.swift
//  
//
//  Created by Chan on 2021/10/13.
//
//  https://www.acmicpc.net/problem/2292

let input = Int(readLine()!)!
var a = 1
for i in 1..< input+1 {
    if input == 1 { print(1); break }
   a += i*6
    if input <= a {
        print(i + 1)
        break
    }
}
