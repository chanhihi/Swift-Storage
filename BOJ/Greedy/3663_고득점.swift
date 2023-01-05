//
//  3663_고득점.swift
//  swift_practise
//
//  Created by Chan on 2023/02/10.
//
//	https://www.acmicpc.net/problem/3663
//
//	MARK: - greedy / bruteforce

func solution(_ name: [Character]) -> Int {
	var count = 0
	var shift = name.count - 1
	for i in 0..<name.count {
		if name[i] == "A" {
			var target = i
			while (target < name.count && name[target] == "A"){
				target += 1
			}
			let left = i == 0 ? 0 : i - 1
			let right = name.count - target
			shift = min(shift, left + right + min(left, right))
		}
	}
	count += shift
	name.forEach {
		count += min(Int($0.asciiValue!) - 65, 91 - Int($0.asciiValue!))
	}
	return count
}

for _ in 0..<Int(readLine()!)! {
	print(solution(readLine()!.map{Character(String($0))}))
}
