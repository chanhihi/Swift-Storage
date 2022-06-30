//
//  combination.swift
//  swift_practise
//
//  Created by Chan on 2022/07/01.
//
//	https://woongsios.tistory.com/179

//MARK: - combination 조합. nCr -> n = 5, r = 3 : 5개중 3개를 뽑는법 / 경우의수에서 자주 사용

func combination(total: [Int], shouldSelect: Int, current index: Int, selected: [Int]) {
	if shouldSelect == 0 {
		print(selected)
	} else if index == total.count {
		return
	} else {
		var newSelected = selected
		newSelected.append(total[index])
		combination(total: total, shouldSelect: shouldSelect-1, current: index+1, selected: newSelected)
		combination(total: total, shouldSelect: shouldSelect, current: index+1, selected: selected)
	}
}

combination(total: [1,2,3,4,5], shouldSelect: 3, current: 0, selected: [])
