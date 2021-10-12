//
//  1712_손익분기점.swift
//  
//
//  Created by Chan on 2021/10/12.
//
//  https://www.acmicpc.net/problem/1712

import Foundation

var n = readLine()!.split(separator: " ").map{Int(String($0))!}
let (a,b,c) = (n[0],n[1],n[2])
if b>=c {
    print(-1)
} else {
    print(a / (c - b) + 1)
}
