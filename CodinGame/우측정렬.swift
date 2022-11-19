//
//  우측정렬.swift
//  swift_practise
//
//  Created by Chan on 2022/11/20.
//

//	MARK: - 들어오는 값들 중 가장 큰 수를 찾아서 해당 큰 수의 자릿수 만큼 전체 우측 정렬

let n = Int(readLine()!)!
var a = [String]()
var maxC = 0
var r = Array(repeating:"",count:n)
if n > 0 {
	for _ in 0...(n-1) {
		let num = readLine()!
		maxC = max(maxC, num.count)
		a.append(num)
	}
	for (i,v) in a.enumerated() {
		for _ in 0..<maxC-v.count{
			r[i].append(" ")
		}
		r[i] += v
	}
}
print(r.joined(separator: "\n"))
