//
//  15651_N과_M_(3).swift
//  swift_practise
//
//  Created by Chan on 2022/09/01.
//
//	https://www.acmicpc.net/problem/15651

//	MARK: - 재귀 / 백트래킹 / 시간초과 고려 (개별 print의 리소스값 고려하여 한번에 담아서 뿌려줌)

let l = readLine()!.split(separator: " ").map {Int(String($0))!}
let N = l[0], M = l[1]
var result = [Int]()
var r = ""
func visit() {
	if result.count == M {
		r += "\(result.map{String($0)}.joined(separator :" "))\n"
		return
	}
	for i in 1...N {
		result.append(i)
		visit()
		result.removeLast()
	}
}
visit()
print(r)
