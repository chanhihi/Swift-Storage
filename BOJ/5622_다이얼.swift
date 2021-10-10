//
//  5622_다이얼.swift
//  
//
//  Created by Chan on 2021/10/11.
//
//  https://www.acmicpc.net/problem/5622


// MARK: - dictionary 사용
var dic = [Character:Int]()
dic = ["A": 3, "B": 3, "C": 3, "D": 4, "E": 4, "F": 4, "G": 5, "H": 5, "I": 5, "J": 6, "K": 6, "L": 6, "M": 7, "N": 7, "O": 7, "P": 8, "Q": 8, "R": 8, "S": 8, "T": 9, "U": 9, "V": 9, "W": 10, "X": 10, "Y": 10, "Z": 10]
var input = readLine()!
var output = 0

for key in dic.keys {
    input.forEach {
        if $0 == key {
            output += dic[key]!
        }
    }
}

print(output)

// MARK: - ?? optional 3항

for i in input {
    output += (dic[i] ?? 0)
}

// MARK: - Array 사용
let n = [ 3,3,3,
4,4,4,
5,5,5,
6,6,6,
7,7,7,
8,8,8,8,
9,9,9,
10,10,10,10 ]
var input = readLine()!
var output = 0

print(input.utf8.reduce(0) { $0 + n[Int($1) - 65] })
