//
//  lv02_프린터.swift
//  
//
//  Created by Chan on 2022/06/27.
//
//	https://programmers.co.kr/learn/courses/30/lessons/42587

//	MARK: - ***

func solution(_ priorities:[Int], _ location:Int) -> Int {
	var priorities = priorities
	var nowIndex = location
	var answer = 0
	
	while true {
		if priorities.first! == priorities.max() {
			
			priorities.removeFirst()
			answer += 1
			
			if nowIndex == 0 {
				break
			} else {
				nowIndex -= 1
			}
		} else {
			let temp = priorities.removeFirst()
			priorities.append(temp)

			if nowIndex == 0 {
				nowIndex = priorities.count - 1
			} else {
				nowIndex -= 1
			}
		}
	}
	return answer
}
