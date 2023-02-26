//
//  9375_패션왕_신해빈.swift
//  swift_practise
//
//  Created by Chan on 2023/02/11.
//
//	https://www.acmicpc.net/problem/9375
//
//	MARK: - dic / combination

for _ in 0..<Int(readLine()!)! {
	var r = [Int]()
	var dic = [String: [String]]()
	let n = Int(readLine()!)!
	if n == 0 { print(0); continue; }

	for _ in 0..<n {
		let value = readLine()!.split(separator: " ").map{String($0)}
		if dic.keys.contains(value[1]) { dic[value[1]]!.append(value[0]) }
		else { dic[value[1]] = [value[0]] }
	}

	for i in dic.values {
		r.append(i.count + 1)
	}
	print(comb(r) - 1)
}

func comb(_ numbers: [Int]) -> Int {
	numbers.reduce(1, *)
}
