//
//  11721_열_개씩_끊어_출력하기.swift
//  
//
//  Created by Chan on 2021/10/28.
//
//  https://www.acmicpc.net/problem/11721

var ten = 0
var line = String(readLine()!)
line.forEach() {
    print($0, terminator: "")
    ten += 1
    if ten == 10 {
        print("")
        ten = 0
    }
}
