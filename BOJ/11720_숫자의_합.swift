//
//  11720_숫자의_합.swift
//  
//
//  Created by Chan on 2021/10/06.
//
// https://www.acmicpc.net/problem/11720

import Foundation

//MARK: - forEach 구문 풀이.

var n = Int(readLine()!)!
var input = String(readLine()!)
var output = 0

input.forEach(){
    output += (Int)($0.asciiValue! - 48)
}

print(output)


// MARK: - 고차함수 풀이 map & reduce
let _ = readLine()!
let input = readLine()!.map { Int(String($0))! }

print(input.reduce(0, +))
