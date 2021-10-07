//
//  2675_문자열_반복.swift
//  
//
//  Created by Chan on 2021/10/07.
//

import Foundation

// MARK: - 기본 풀이
var T = Int(readLine()!)!
var s = [String]()

for _ in 1...T {
    s = readLine()!.split(separator: " ").map{String($0)}
    var P = ""
    for index in s[1] {
        for _ in 1...Int(s[0])!{
            P += String(index)
        }
    }
    print(P)
}

// MARK: - string return 함수 사용

var n = Int(readLine()!)!

for _ in 1...n {
    var s = readLine()!.split(separator: " ").map{String($0)}
    var P = ""
    var R = Int(s[0])!
    for index in s[1] {
        P += addStr(R, String(index))
    }
    print(P)
}

func addStr(_ count:Int , _ str:String) -> String {
    var result = ""
    for _ in 0..<count { result += str }
    return result
}
