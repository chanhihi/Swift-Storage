//
//  1316_그룹_단어_체커.swift
//  
//
//  Created by Chan on 2021/10/11.
//
//  https://www.acmicpc.net/problem/1316

import Foundation

var output = 0
let n = Int(readLine()!)!

for _ in 0..<n {
    var checker : [Character] = []
    var s = readLine()!
    
    for c in s {
        if !checker.contains(c){
            checker.append(c)
        } else if checker.last! != c{
            checker.removeAll()
            break
        }
    }

    if checker.count != 0 { output += 1}
}

print(output)
