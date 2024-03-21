//
//  combination.swift
//  swift_practise
//
//  Created by Chan on 2023/04/05.
//
//	서로 다른 N개의 원소 중에서 R개를 순서 없이 골라낸 것.
//	nums배열에서 targetNum가지의 경우의수 구하기.

func combi(_ nums: [Int], _ targetNum: Int) -> [[Int]] {
	var result = [[Int]]()
	
	combination(0, [])
	
	return result
	
	func combination(_ index: Int, _ nowCombi: [Int]) {
		if nowCombi.count == targetNum {
			result.append(nowCombi)
			return
		}
		for i in index..<nums.count {
			combination(i + 1, nowCombi + [nums[i]])
		}
	}
}

print(combi([1,2,3,4], 3))
