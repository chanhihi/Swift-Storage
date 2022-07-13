//
//  2920_음계.swift
//  swift_practise
//
//  Created by Chan on 2022/07/13.
//
//	https://www.acmicpc.net/problem/2920

let v = readLine()!.split(separator: " ").map{Int($0)!}
let ascending = [1,2,3,4,5,6,7,8]
let descending = [8,7,6,5,4,3,2,1]

if v == ascending {print("ascending")}
else if v == descending {print("descending")}
else {print("mixed")}
