//
//  피로도.swift
//  swift_practise
//
//  Created by Chan on 2022/07/02.
//
//	https://programmers.co.kr/learn/courses/30/lessons/87946

//	MARK: - 재귀 / 
func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
	var answer:Int = 0
	explore(dungeons: dungeons, answer: &answer, k:k, count: 0)
	return answer
}

func explore(dungeons:[[Int]],answer:inout Int,k:Int,count:Int) {
	answer = max(answer,count)
	for (i,dungeon) in dungeons.enumerated() {
		var newDungeons:[[Int]] = dungeons
		if dungeon[0] <= k && dungeon[1] <= k{
			let newK = k - dungeon[1]
			newDungeons.remove(at: i)
			explore(dungeons:newDungeons,answer: &answer,k: newK,count: count + 1)
		}
	}
}

print(solution(80,	[[80,20],[50,40],[30,10]]))	//3
