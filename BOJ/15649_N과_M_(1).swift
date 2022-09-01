//
//  15649_N과_M_(1).swift
//  swift_practise
//
//  Created by Chan on 2022/09/01.
//
//	https://www.acmicpc.net/problem/15649

//	재귀 백트래킹 
let l = readLine()!.split(separator: " ").map {Int(String($0))!}
let (N, M) = (l[0], l[1])
var result = [Int]()

func visit() {
	if result.count == M {
		print(result.map{String($0)}.joined(separator :  " "))
		return
	}
	for i in 1...N {
		if !result.contains(i) {
			result.append(i)
			visit()
			result.removeLast()
		}
	}
}

visit()
