//
//  15657_N과_M_(8).swift
//  swift_practise
//
//  Created by Chan on 2022/09/01.
//
//	https://www.acmicpc.net/problem/15657
//	MARK: - 백트래킹 / 재귀

let l = readLine()!.split{$0==" "}.map {Int(String($0))!}
let arr = readLine()!.split{$0==" "}.map {Int(String($0))!}.sorted()
let (N, M) = (l[0], l[1])
var result = [Int]()
var r = ""

func visit() {
	if result.count == M {
		r += (result.map{String($0)}.joined(separator :" ") + "\n")
		return
	}
	for ar in arr {
		if result.last ?? 0 <= ar {
			result.append(ar)
			visit()
			result.removeLast()
		}
	}
}

visit()
print(r)
