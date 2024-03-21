//
//  pick.swift
//  swift_practise
//
//  Created by Chan on 2023/04/04.
//
//	code 6.2 / 149p
//
//	n개의 원소 중 m개를 고르는 모든 조합을 찾는 알고리즘
//


/*
 * n: 전체 원소의 수
 * picked: 지금까지 고른 원소들의 번호
 * toPick: 더 고를 원소의 수
 * 일 때, 앞으로 toPick개의 원소를 고르는 모든 방법을 출력한다.
 */

pick(n: 10, picked: [], toPick: 2) // 1 ~ 10 개 원소의 수, 고른 것이 없을 때, 더 고를 원소의 수

func pick(n: Int, picked: [Int], toPick: Int) {
	var picked = picked
	
	if toPick == 0 {
		print(picked)
		return
	}
	var smallest = picked.isEmpty ? 0 : picked.last! + 1
	
	for i in smallest..<n {
		picked.append(i)
		pick(n: n, picked: picked, toPick: toPick - 1)
		picked.popLast()
	}
}
