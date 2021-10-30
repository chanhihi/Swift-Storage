//
//  10818_최소_최대.swift
//  
//
//  Created by Chan on 2021/10/30.
//
//https://www.acmicpc.net/problem/10818


//MARK: - min max 사용

let x = readLine()
var arr = readLine()!.split(separator: " ").map { Int(String($0))! }
print(arr.min()!, arr.max()!)

//MARK: - 정렬 사용

let x = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int(String($0))! }
arr.sort()
print(arr[0], arr[x-1])
