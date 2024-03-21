//
//  permutation.swift
//  swift_practise
//
//  Created by Chan on 2023/04/05.
//
//	서로 다른 N개의 원소를 일렬로 줄 세운 것.
//	N이 10이 넘어간다면 시간 안에 모든 순열을 생성하기 어려우므로 완전탐색 말고 다른 방법 생각해야함.

func permute(_ nums: [Int], _ targetNum: Int) -> [[Int]] {
	var result = [[Int]]()
	var visited = Array(repeating: false, count: nums.count)
	
	permutation([])
	
	return result
	
	func permutation(_ nowPermute: [Int]) {
		if nowPermute.count == targetNum {
			result.append(nowPermute)
			return
		}
		for i in 0..<nums.count {
			if visited[i] == true {
				continue
			} else {
				visited[i] = true
				permutation(nowPermute + [nums[i]])
				visited[i] = false
			}
		}
	}
}

print(permute([1,2,3,4], 3))
