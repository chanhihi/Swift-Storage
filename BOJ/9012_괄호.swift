//
//  9012_괄호.swift
//  swift_practise
//
//  Created by Chan on 2022/07/27.
//
//	https://www.acmicpc.net/problem/9012

var N = Int(readLine()!)!
for _ in 0..<N{
	let l = readLine()!.map{String($0)}
	var temp = [String]()
	var noFlag = false
	for (_, v) in l.enumerated() {
		if v == ")" {
			if !temp.isEmpty {
				if temp.last! == "(" {temp.removeLast()}
				else {temp.append(v)}
			} else {noFlag = true}
		} else {temp.append(v)}
	}
	if temp.isEmpty && noFlag == false {print("YES")}
	else {print("NO")}
}
