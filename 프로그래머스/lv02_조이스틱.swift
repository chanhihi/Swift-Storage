//
//  그리디_2_조이스틱.swift
//
//
//  Created by Chan on 2021/12/02.
//
//	https://programmers.co.kr/learn/courses/30/lessons/42860

// 재풀이: 주석
// MARK: - (2n + total - n+1), (total - n+1)2 + n 식을 사용한 풀이
//shortestDistance = min(distance[i] * 2 + totalDistance - distance[i+1], shortestDistance)
//shortestDistance = min((totalDistance - distance[i+1]) * 2 + distance[i], shortestDistance)

let ALPHABET = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]

func solution(_ name:String) -> Int {
	let totalDistance = name.count		//	name length
	var result = Array(repeating: 0, count: totalDistance)		// name len -> result
	var checkZero = true				// name에 a가 존재 하는지 확인
	var distance: [Int] = []			// a의 인덱싱 거리
	var shortestDistance = Int.max		// 가장 짧은 거리
	
	for (index, nm) in name.enumerated() {					// 색인
		var count = ALPHABET.firstIndex(of: String(nm))		// 해당 알파벳 숫자로 변환(거리 측정)
		if count! > 13 {			// 위에서부터 아래에서부터 중 가장 짧은것 선택.
			count = 26 - count!
		}
		result[index] += count!		// 결과에 해당 거리를 저장.
		
		if count! == 0 {
			checkZero = false
		} else {
			distance.append(index)	// 해당하는 a의 값이 어디에 있는지
		}
	}
	
	if result.reduce(0,+) == 0 { return 0 }	// 값이 없을때의 예외처리 (A)만 존재할 때.
	if checkZero { return result.reduce(0,+) + name.count - 1 }	// A가 없는경우에는 결과 + count (순서대로 count)
	
	print(distance)
	print(result)
	
	for i in 0..<distance.count-1 {	// A 가 존재하는경우 어디로 가야 가장 빠른지 ?
		shortestDistance = min(distance[i] * 2 + totalDistance - distance[i+1], shortestDistance)
		shortestDistance = min((totalDistance - distance[i+1]) * 2 + distance[i], shortestDistance)
	}
	
	shortestDistance = min(distance[distance.count - 1], totalDistance - distance[0], shortestDistance)
	
	print(shortestDistance)
	
	return result.reduce(0,+) + shortestDistance
}


//print(solution("JEROEN"))
//print(solution("JNAAB"))
print(solution("JANBAAAAB"))
//print(solution("AAAAA"))
