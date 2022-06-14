//
//  메뉴_리뉴얼.swift
//  
//
//  Created by Chan on 2022/06/14.
//
//	https://programmers.co.kr/learn/courses/30/lessons/72411

import Foundation

private func solution(_ orders:[String], _ course:[Int]) -> [String] {
	var menuSet: [String: Int] = [:]
	var result: [String] = []
	
	// 메뉴마다 나올수있는 코스 조합
	func combination(origin: [Character], n: Int, resultString: String) {
//		print("origin \(origin) / n \(n) / resultString \(resultString)")	// 재귀 타는 곳 보여줌.
//		print("\n")
		if resultString.count > 1 && course.contains(resultString.count) {
			if menuSet.keys.contains(resultString) {
				menuSet[resultString]! += 1
			} else {
				menuSet[resultString] = 1
			}
		}
		for i in n+1..<origin.count {
			combination(origin: origin, n: i, resultString: "\(resultString)\(origin[i])")
		}
//		print("menu : \(menu)")	// 추가되는 재귀 보여줌
//		print("\n")
	}
	
	// 메뉴순회
	for order in orders {
		let menus: [Character] = order.map { $0 }.sorted()
		for i in menus.indices {
			combination(origin: menus, n: i, resultString: "\(menus[i])")
		}
	}
	
	// 가장많은 코스 찾기
	for n in course {
		let max = menuSet.filter { $0.key.count == n && $0.value > 1 }.max { $0.value < $1.value }
		// 가장 많이 선택된 메뉴 선택
		if let max = max {
			menuSet.filter { $0.key.count == n }.forEach {
				if $0.value == max.value {
					result.append($0.key)
				}
			}
		}
	}
	
	print(result.sorted())
	return result.sorted()
}

//solution72411(["ABCFG", "AC", "CDE", "ACDE", "BCFG", "ACDEH"], [2,3,4])
//solution72411(["ABCDE", "AB", "CD", "ADE", "XYZ", "XYZ", "ACD"], [2,3,5])
//solution72411(["XYZ", "XWY", "WXA"], [2,3,4])
출처: https://nsios.tistory.com/118 [NamS의 iOS일기:티스토리]
