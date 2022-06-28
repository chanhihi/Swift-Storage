//
//  1977_완전제곱수.swift
//  
//
//  Created by Chan on 2022/06/28.
//
//	https://www.acmicpc.net/problem/1977

//let M = Int(readLine()!)!
//let N = Int(readLine()!)!

let M = 60
let N = 100

var O = [Int]()

func mysqrt(_ n: Int) -> Bool {
	var i = 1;
	while i * i <= n {
		if i * i == n { return true }
		i += 1
	}
	return false
}

for j in M...N {
	if mysqrt(j) {O.append(j)}
}

if O.isEmpty {
	print(-1)
} else {
	print(O.reduce(0, +))
	print(O.min()!)
}
