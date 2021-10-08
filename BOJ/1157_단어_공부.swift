//
//  1157_단어_공부.swift
//  
//
//  Created by Chan on 2021/10/08.
//
//  https://www.acmicpc.net/problem/1157

import Foundation

// MARK: - Array 사용 index값을 Convert ascii value
var input = readLine()!.uppercased()
var cased = [Int](repeating: -1, count: 26)
var output = ""
var exception = 0

for index in input{
    cased[(Int)(index.asciiValue!) - 65] += 1
}

for i in 0...25 {
    if cased[i] == cased.max(){
        output.append(Character(UnicodeScalar(i + 65)!))
        exception += 1
    }
}
print(exception == 1 ? output : "?")

if exception == 1 { print(output) }
else { print("?")}

// MARK: - Dictionary 사용

let input = readLine()!.uppercased()
var dicCased = [String:Int]()
var output = [String]()

input.forEach {
    if dicCased[String($0)] == nil{
        dicCased[String($0)] = 1
    }else{
        dicCased[String($0)]! += 1
    }
}

for key in dicCased.keys {
    if dicCased[key] == dicCased.values.max(){
        output.append(key)
    }
}
print(output.count == 1 ? output[0] : "?")
