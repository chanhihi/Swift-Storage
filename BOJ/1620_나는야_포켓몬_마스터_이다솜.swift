//
//  1620_나는야_포켓몬_마스터_이다솜.swift
//  swift_practise
//
//  Created by Chan on 2022/08/06.
//
//	https://www.acmicpc.net/problem/1620
//	MARK: - result[any] / dic double 
import Foundation
let l = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, M) = (l[0], l[1])
var n = [String:Int]()
var o = [Int:String]()
var result = [Any]()
var count = 1
for _ in 0..<N{
	let r = readLine()!
	n[r] = count
	o[count] = r
	count += 1
}
for _ in 0..<M{
	let m = readLine()!
	let number = Int(m) ?? -1
	if number == -1 {
		result.append(n[m]!)
	} else {
		result.append(o[number]!)
	}
}
result.forEach {
	print($0)
}
