//
//  1822_차집합.swift
//  swift_practise
//
//  Created by Chan on 2023/03/06.
//
//	https://www.acmicpc.net/problem/1822
//
//	MARK: - dictionary

let NL = readLine()!.split(separator: " ").map{Int(String($0))!}
var dic = [Int: Bool]()
var ar = [Int]()

readLine()!.split(separator: " ").map{Int(String($0))!}.forEach{
	dic[$0] = true
}
readLine()!.split(separator: " ").map{Int(String($0))!}.forEach{
	dic[$0] = nil
}

dic.keys.forEach{
	ar.append($0)
}
let r = ar.count
print(r)
if r != 0 {
	print(ar.sorted(by: <).map{String($0)}.joined(separator: " "))
}
