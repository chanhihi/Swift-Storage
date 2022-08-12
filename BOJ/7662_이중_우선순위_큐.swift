//
//  7662_이중_우선순위_큐.swift
//  swift_practise
//
//  Created by Chan on 2022/08/12.
//
//	https://www.acmicpc.net/problem/7662
//	MARK: - file io, priority queue / 이중 우선순위 큐 / 최대힙 / 최소힙
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
	
	@inline(__always) func readString() -> String {
		var now = read()
		
		while now == 10 || now == 32 { now = read() }
		let beginIndex = index-1
		
		while now != 10,
			  now != 32,
			  now != 0 { now = read() }
		
		return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
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

struct DualHeap<T: Comparable & Hashable> {
	struct MaxHeap<T: Comparable> {
		var heap = [T]()
		
		init(){}
		init(_ h: T) {heap.append(h); heap.append(h)}
		
		var isEmpty: Bool {heap.count <= 1}
		
		var first: T? {isEmpty ? nil : heap[1]}
		
		mutating func insert(_ h:T){
			heap.append(h)
			if isEmpty{heap.append(h)}
			var isrt = heap.count-1
			while isrt > 1 && heap[isrt] > heap[isrt/2]{
				heap.swapAt(isrt, isrt/2)
				isrt /= 2
			}
		}
		
		enum Direction {case none, lf, ryt}
		mutating func pop() -> T? {
			func haveToDown(_ pop:Int) -> Direction {
				let lf = pop*2, ryt = lf+1
				while lf >= heap.count {return .none}
				while ryt >= heap.count {return heap[lf] > heap[pop] ? .lf: .none}
				if heap[lf] <= heap[pop] && heap[ryt] <= heap[pop] {return .none}
				if heap[lf] > heap[pop] && heap[ryt] > heap[pop] {return heap[lf] > heap[ryt] ? .lf : .ryt}
				return heap[lf] > heap[pop] ? .lf: .ryt
			}
			if isEmpty {return nil}
			heap.swapAt(1, heap.count-1)
			let returnData = heap.popLast()!
			
			var pop = 1
			while true {
				switch haveToDown(pop){
				case .none:
					return returnData
				case .lf:
					heap.swapAt(pop, pop*2)
					pop *= 2
				case .ryt:
					heap.swapAt(pop, pop*2+1)
					pop = pop*2 + 1
				}
			}
		}
	}
	
	struct MinHeap<T: Comparable> {
		var heap = [T]()
		
		init(){}
		init(_ h: T) {heap.append(h); heap.append(h)}
		
		var isEmpty: Bool {heap.count <= 1}
		
		var first: T? {isEmpty ? nil : heap[1]}
		
		mutating func insert(_ h:T){
			heap.append(h)
			if isEmpty{heap.append(h)}
			var isrt = heap.count-1
			while isrt > 1 && heap[isrt] < heap[isrt/2]{
				heap.swapAt(isrt, isrt/2)
				isrt /= 2
			}
		}
		
		enum Direction { case none, lf, ryt}
		mutating func pop() -> T? {
			func haveToDown(_ pop:Int) -> Direction {
				let lf = pop*2, ryt = lf+1
				while lf >= heap.count {return .none}
				while ryt >= heap.count {return heap[lf] < heap[pop] ? .lf: .none}
				if heap[lf] >= heap[pop] && heap[ryt] >= heap[pop] {return .none}
				if heap[lf] < heap[pop] && heap[ryt] < heap[pop] {return heap[lf] < heap[ryt] ? .lf : .ryt}
				return heap[lf] < heap[pop] ? .lf: .ryt
			}
			if isEmpty {return nil}
			heap.swapAt(1, heap.count-1)
			let returnData = heap.popLast()!
			
			var pop = 1
			while true {
				switch haveToDown(pop){
				case .none:
					return returnData
				case .lf:
					heap.swapAt(pop, pop*2)
					pop *= 2
				case .ryt:
					heap.swapAt(pop, pop*2+1)
					pop = pop*2 + 1
				}
			}
		}
	}
	
	private var maxHeap = MaxHeap<T>()
	private var minHeap = MinHeap<T>()
	private var count = [T: Int]()
	
	init(){}
	
	private mutating func rmvUsed() {
		while let top = maxHeap.first {
			if count[top, default: 0] > 0 {
				break
			}
			count.removeValue(forKey: top)
			_ = maxHeap.pop()
		}
		while let top = minHeap.first {
			if count[top, default: 0] > 0 {
				break
			}
			count.removeValue(forKey: top)
			_ = minHeap.pop()
		}
	}
	
	mutating func maxFirst() -> T? {
		rmvUsed()
		return maxHeap.first
	}
	
	mutating func minFirst() -> T? {
		rmvUsed()
		return minHeap.first
	}
	
	mutating func isEmpty() -> Bool {
		rmvUsed()
		return maxHeap.isEmpty
	}
	
	mutating func insert(_ h: T) {
		maxHeap.insert(h)
		minHeap.insert(h)
		count[h, default: 0] += 1
	}
	
	mutating func maxPop() -> T? {
		rmvUsed()
		if isEmpty() { return nil }
		count[maxHeap.first!, default: 0] -= 1
		return maxHeap.pop()
	}
	
	mutating func minPop() -> T? {
		rmvUsed()
		if isEmpty() { return nil }
		count[minHeap.first!, default: 0] -= 1
		return minHeap.pop()
	}
	
	mutating func remove(_ h: T) {
		count[h, default: 0] -= 1
	}
}

let io = FileIO()
let T = io.readInt()

var result = ""
for _ in 0..<T {
	let k = io.readInt()
	var dualHeap = DualHeap<Int>()
	
	for _ in 0..<k {
		if io.readString() == "I" {
			dualHeap.insert(io.readInt())
		} else {
			if io.readInt() == 1 {
				_ = dualHeap.maxPop()
			} else {
				_ = dualHeap.minPop()
			}
		}
	}
	
	if dualHeap.isEmpty() {
		result += "EMPTY\n"
	} else {
		result += "\(dualHeap.maxFirst()!) \(dualHeap.minFirst()!)\n"
	}
}

print(result)
