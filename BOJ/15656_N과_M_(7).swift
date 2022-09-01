//
//  15656_N과_M_(7).swift
//  swift_practise
//
//  Created by Chan on 2022/09/01.
//
//	https://www.acmicpc.net/problem/15656
//	MARK: - 백트래킹 / 재귀 / 시간 초과

let l = readLine()!.split{$0==" "}.map {Int(String($0))!}
let arr = readLine()!.split{$0==" "}.map {Int(String($0))!}.sorted()
let (N, M) = (l[0], l[1])
var result = [String]()
var r = ""

func visit() {
	if result.count == M {
		r += (result.joined(separator :" ") + "\n")
		return
	}
	for ar in arr {
		result.append(String(ar))
		visit()
		result.removeLast()
	}
}

visit()
print(r)
