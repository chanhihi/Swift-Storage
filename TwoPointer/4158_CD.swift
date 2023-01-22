//
//  4158_CD.swift
//  swift_practise
//
//  Created by Chan on 2023/02/27.
//
//	https://www.acmicpc.net/problem/4158
//
//	MARK: - Twopointer / 부분합 / fileIO 사용으로 시간초과 제거

import Foundation

final class FileIO {
	private let buffer:[UInt8]
	private var index: Int = 0
	
	init(fileHandle: FileHandle = FileHandle.standardInput) {
		buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)]
	}
	
	@inline(__always) private func read() -> UInt8 {
		defer { index += 1 }
		return buffer[index]
	}
	
	@inline(__always) func readInt() -> Int {
		var sum = 0
		var now = read()
		var isPositive = true
		
		while now == 10 || now == 32 { now = read() }
		if now == 45 { isPositive.toggle(); now = read() }
		while now >= 48, now <= 57 {
			sum = sum * 10 + Int(now-48)
			now = read()
		}
		
		return sum * (isPositive ? 1:-1)
	}
	
	@inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
		var now = read()
		
		while now == 10 || now == 32 { now = read() }
		let beginIndex = index-1
		while now != 10,
			  now != 32,
			  now != 0 { now = read() }
		return Array(buffer[beginIndex..<(index-1)])
	}
}

let io = FileIO()

while true {
	let (n, m) = (io.readInt(), io.readInt())
	if n == 0 && m == 0 { break }
	var an = [Int]()
	var am = an
	var count = 0
	
	for _ in 0..<n { an.append(io.readInt()) }
	for _ in 0..<m { am.append(io.readInt()) }
	
	let anLen = an.count, amLen = am.count
	var andx = 0, amdx = 0
	while andx < anLen && amdx < amLen {
		if an[andx] == am[amdx] {
			count += 1
			andx += 1
			amdx += 1
		} else {
			if an[andx] > am[amdx] {
				amdx += 1
			} else {
				andx += 1
			}
		}
	}
	print(count)
}
