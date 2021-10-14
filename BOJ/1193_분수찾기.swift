//
//  1193_분수찾기.swift
//  
//
//  Created by Chan on 2021/10/14.
//  https://www.acmicpc.net/problem/1193

var n = Int(readLine()!)!
var count = 1
while true {
    n = n - count
    if n <= 0 {
        break
    }
    count = count + 1
}
if count % 2 == 1 {
    print("\(-n+1)/\(n+count)")
} else {
    print("\(n+count)/\(-n+1)")
}
