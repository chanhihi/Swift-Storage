//
//  2941_크로아티아_알파벳.swift
//  
//
//  Created by Chan on 2021/10/11.
//
//  https://www.acmicpc.net/problem/2941

import Foundation

var arr = ["c=", "c-", "dz=", "d-", "lj", "nj", "s=", "z="]
var input = readLine()!

for i in 0...arr.count - 1 {
    input = input.replacingOccurrences(of:arr[i], with:"1")
}

print(input.count)

// MARK: - forEach

import Foundation

var arr = ["c=", "c-", "dz=", "d-", "lj", "nj", "s=", "z="]
var input = readLine()!

arr.forEach {
    input = input.replacingOccurrences(of:$0, with:"1")
}

print(input.count)


