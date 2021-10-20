//
//  10757_큰_수_A+B.swift
//  
//
//  Created by Chan on 2021/10/20.
//
//  https://www.acmicpc.net/problem/10757

let input = readLine()!.split { $0 == " " }
var inputA = Array(input[0]).map { Int(String($0))! }
var inputB = Array(input[1]).map { Int(String($0))! }

if inputA.count > inputB.count {
    let diff = inputA.count - inputB.count
    for _ in 0 ..< diff {
        inputB.insert(0, at: inputB.startIndex)
    }
}else{
    let diff = inputB.count - inputA.count
    for _ in 0 ..< diff {
        inputA.insert(0, at: inputA.startIndex)
    }
}
for i in 0 ..< inputA.count {
    inputA[i] += inputB[i]
}
for i in (1 ..< inputA.count).reversed() {
    if inputA[i] >= 10 { inputA[i-1] += 1 }
    inputA[i] = inputA[i] % 10
}
var stringA = inputA.map{ String($0) }
let result = stringA.joined(separator: "")
print(result)

