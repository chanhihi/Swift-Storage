//
//  10989_수_정렬하기_3.swift
//  swift_practise
//
//  Created by Chan on 2022/07/18.
//
//	https://www.acmicpc.net/problem/10989
//	MARK: - fileIO(ryno) 적용풀이
import Foundation

final class FileIO {
	private var buffer:[UInt8]
	private var index: Int

	init(fileHandle: FileHandle = FileHandle.standardInput) {
		buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)]
		index = 0
	}

	@inline(__always) private func read() -> UInt8 {
		defer { index += 1 }
		return buffer.withUnsafeBufferPointer { $0[index] }
	}

	@inline(__always) func readInt() -> Int {
		var sum = 0
		var now = read()
		var isPositive = true

		while now == 10
			|| now == 32 { now = read() }
		if now == 45{ isPositive.toggle(); now = read() }
		while now >= 48, now <= 57 {
			sum = sum * 10 + Int(now-48)
			now = read()
		}
		return sum * (isPositive ? 1:-1)
	}

	@inline(__always) func readString() -> String {
		var str = ""
		var now = read()
		while now == 10
			|| now == 32 { now = read() }
		while now != 10
			&& now != 32 && now != 0 {
				str += String(bytes: [now], encoding: .ascii)!
				now = read()
		}
		return str
	}
}
let file = FileIO()
var a = [Int](repeating: 0, count: 10001)
var n = file.readInt()
//var n = Int(readLine()!)!
for _ in 0..<n {
	let q = file.readInt()
	a[q] += 1
}
var result = ""
for i in 1...10000 {
	result += String(repeating: "\(i)\n", count: a[i])
}
print(result)


// MARK: - readLine() 4528ms
//var a = [Int](repeating: 0, count: 10001)
//var n = Int(readLine()!)!
//for _ in 0..<n {
//	let q = Int(readLine()!)!
//	a[q] += 1
//}
//var result = ""
//for i in 1...10000 {
//	result += String(repeating: "\(i)\n", count: a[i])
//}
//print(result)
