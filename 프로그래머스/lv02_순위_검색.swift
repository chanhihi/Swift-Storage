//
//  lv02_순위_검색.swift
//  
//
//  Created by Chan on 2022/06/30.
//
//	https://programmers.co.kr/learn/courses/30/lessons/72412#

// MARK: - ***** 반드시 다시 봐서 익힐것.
import Foundation // components 사용

func solution(_ info:[String], _ query:[String]) -> [Int] {
	var answerArray = [Int]()
	var database = [String: [Int]]()
	for (index, element) in info.enumerated() {
		var information = element.components(separatedBy: " ")
		
		var languages: [String] = [information[0], "-"]
		var backFronts: [String] = [information[1], "-"]
		var careers: [String] = [information[2], "-"]
		var soulFoods: [String] = [information[3], "-"]
		
		for language in languages {
			for backFront in backFronts {
				for career in careers {
					for soulFood in soulFoods {
						var key = "\(language)\(backFront)\(career)\(soulFood)"
						if database[key] == nil {
							database[key] = [Int(information[4])!]
						} else {
							database[key]!.append(Int(information[4])!)
						}
					}
				}
			}
		}
	}
	// 이진 탐색을 위한 db value sort
	for db in database {
		database[db.key] = db.value.sorted()
	}
	
	for (i, e) in query.enumerated() {
		
		var q = e.components(separatedBy: " ")
		var lang = q[0]
		var backFront = q[2]
		var career = q[4]
		var soulFood = q[6]
		var score = Int(q[7])!
		
		if let values: [Int] = database["\(lang)\(backFront)\(career)\(soulFood)"] {
			var lowIndex = 0
			var highIndex = values.count
			
			while lowIndex < highIndex {
				let midIndex = (lowIndex + highIndex) / 2
				if (score <= values[midIndex]) {
					highIndex = midIndex
				} else {
					lowIndex = midIndex + 1
				}
			}
			answerArray.append(values.count - lowIndex)
		} else {
			answerArray.append(0)
		}
	}
	return answerArray
}
