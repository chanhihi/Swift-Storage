//
//  11723_집합.swift
//  swift_practise
//
//  Created by Chan on 2022/08/06.
//
//	https://www.acmicpc.net/problem/11723

//	MARK: - 빠른입출력 + 형변환 제거로 input speed 극대화
import Foundation

@inline(__always) private var buffer: [UInt8] = Array(FileHandle.standardInput.readDataToEndOfFile()) + [0], byteIdx = 0
@inline(__always) private func readByte() -> UInt8 {
	defer { byteIdx += 1 }
	return buffer.withUnsafeBufferPointer { $0[byteIdx] }
}
@inline(__always) func readInt() -> Int {
	var number = 0, byte = readByte(), isNegative = false
	while byte == 10 || byte == 32 { byte = readByte() }
	if byte == 45 { byte = readByte(); isNegative = true }
	while 48...57 ~= byte { number = number * 10 + Int(byte - 48); byte = readByte() }
	return number * (isNegative ? -1 : 1)
}
@inline(__always) func readStirngSum() -> Int {
	var byte = readByte()
	while byte == 10 || byte == 32 { byte = readByte() }
	var sum = Int(byte)
	while byte != 10 && byte != 32 && byte != 0 { byte = readByte(); sum += Int(byte) }
	return sum - Int(byte)
}
@inline(__always) func write(_ output: String) {
	FileHandle.standardOutput.write(output.data(using: .utf8)!)
}

var bit: Int = 0
var answer = ""
for _ in 0..<readInt() {
	switch readStirngSum() {
	case 297: // add
		let num = readInt()
		bit |= (1 << num)
	case 654: // remove
		let num = readInt()
		bit &= ~(1 << num)
	case 510: // check
		let num = readInt()
		answer += (bit & (1 << num) == 0) ? "0\n" : "1\n"
	case 313: // all
		bit |= ~0
	case 559: // empty
		bit = 0
	case 642: // toggle
		let num = readInt()
		bit ^= (1 << num)
	default: break
	}
}
print(answer)
