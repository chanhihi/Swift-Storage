//
//  2869_달팽이는_올라가고_싶다.swift
//  
//
//  Created by Chan on 2021/10/15.
//
//  https://www.acmicpc.net/problem/2869


//  MARK: - 시간초과: 루프로 찾기
var n = readLine()!.split(separator: " ").map { Int($0)!}
let (A,B,V) = (n[0], n[1], n[2])
var M = 0
var count = 1

while true {
    M += A
    if M >= V {
        break
    }
    M -= B
    count += 1
}
print(count)

//MARK: - 값계산

var n = readLine()!.split(separator: " ").map { Int(String($0))!}
let (A,B,V) = (n[0], n[1], n[2])

if (V - A) % (A - B) == 0 {
    print((V - A) / (A - B) + 1)
} else {
    print((V - A) / (A - B) + 2)
}
