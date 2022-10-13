//
//  6378_디지털_루트.swift
//  swift_practise
//
//  Created by Chan on 2022/10/14.
//
//	https://www.acmicpc.net/problem/6378
//	MARK: - 큰수계산
while true {
	var l = readLine()!.map{Int(String($0))!}
	while l.count != 1 {
		let a = l.popLast()!
		let b = l.popLast()!
		l.append((a+b)%10+(a+b)/10)
	}
	if l[0] == 0 {
		break
	}
	print(l[0])
}
