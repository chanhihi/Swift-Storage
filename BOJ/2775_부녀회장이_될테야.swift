//
//  2775_부녀회장이_될테야.swift
//  
//
//  Created by Chan on 2021/10/18.
//
//  https://www.acmicpc.net/problem/2775

var apt : [[Int]] = Array(repeating: Array(repeating: 1, count: 15), count: 15)
var T = Int(readLine()!)!

for _ in 1...T {
    var k = Int(readLine()!)!
    var n = Int(readLine()!)!
    
    for I in 1...n {
        apt[0][I] =  I + 1
    }
    
    for Ik in 1...k {
        for In in 1...n {
            apt[Ik][In] = apt[Ik][In - 1] + apt[Ik - 1][In]
        }
    }
    
    print(apt[k][n-1])
}

