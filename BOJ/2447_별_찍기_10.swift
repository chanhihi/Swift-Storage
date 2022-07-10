//
//  2447_별_찍기_10.swift
//  swift_practise
//
//  Created by Chan on 2022/07/10.
//
//	https://www.acmicpc.net/problem/2447

//	MARK: - 분할정복
let n = Int(String(readLine()!))!
var s = ""
for i in 0..<n {
	for j in 0..<n {
		tS(n,i,j)
	}
	s+="\n"
}
print(s)
func tS(_ n: Int,_ i: Int,_ j: Int) {
	if (i/n)%3==1 && (j/n)%3==1 {s+=" "} else {
		if n / 3 == 0 {
			s += "*"
		}else {
			tS(n / 3, i, j)
		}
	}
}
