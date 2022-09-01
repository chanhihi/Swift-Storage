//
//  15655_N과_M_(6).swift
//  swift_practise
//
//  Created by Chan on 2022/09/01.
//
//	https://www.acmicpc.net/problem/15655
//	MARK: - 백트래킹 / 재귀
let l = readLine()!.split(separator: " ").map {Int(String($0))!}
let arr = readLine()!.split(separator: " ").map {Int(String($0))!}
let (N, M) = (l[0], l[1])
var result = [Int]()

func visit() {
	if result.count == M {
		print(result.map{String($0)}.joined(separator :" "))
		return
	}
	for ar in arr.sorted() {
		if result.last ?? 0 < ar {
			result.append(ar)
			visit()
			result.removeLast()
		}
	}
}

visit()
