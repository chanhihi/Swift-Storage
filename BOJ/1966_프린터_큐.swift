//
//  1966_프린터_큐.swift
//  swift_practise
//
//  Created by Chan on 2022/08/02.
//
//	https://www.acmicpc.net/problem/1966

//	MARK: - queue 기본

struct Queue {
	var queue = [(Int, Int)]()
	var index = 0

	init(_ array: Array<Int>) {
		for (i, num) in array.enumerated() {
			queue.append((i, num))
		}
	}

	var count: Int {
		return queue.count - index
	}

	var isPrintable: Bool {
		if queue.count == 1 { return true }
		for i in (index + 1)..<queue.count {
			if queue[i].1 > queue[index].1 { return false }
		}
		return true
	}

	mutating func push(_ tuple: (Int, Int)) {
		queue.append(tuple)
	}

	mutating func pop() -> (Int, Int) {
		defer {
			index += 1
		}
		return queue[index]
	}
}

let N = Int(readLine()!)!

for _ in 0..<N {
	let input1 = readLine()!.split(separator: " ").map { Int(String($0))! }
	let M = input1[1]
	let input2 = readLine()!.split(separator: " ").map { Int(String($0))! }
	var queue = Queue(input2)
	var cnt = 0
	while true {
		if queue.isPrintable {
			let printed = queue.pop()
			cnt += 1
			if printed.0 == M { break }
		} else {
			queue.push(queue.pop())
		}
	}
	print(cnt)
}
