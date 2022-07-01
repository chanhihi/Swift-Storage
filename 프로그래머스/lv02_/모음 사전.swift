//
//  모음 사전.swift
//  swift_practise
//
//  Created by Chan on 2022/07/02.
//

// dic 미리 알아놓고 풀기 (카운트)
func dic_solution(_ word:String) -> Int {
	let vowelsDic = ["A":0,"E":1,"I":2,"O":3,"U":4]
	let count = [781,156,31,6,1] // 다음 모음으로 이동하는데 필요한 갯수.
	
	return word.enumerated().map{countDic[$0.offset]*vowelsDic[String($0.element)]!}.reduce(word.count) { $0 + $1}
}


// 재귀 풀이.
import Foundation

let words: [String] = ["A", "E", "I", "O", "U"]
var flag: Bool = false
var res: Int = 0 // 입력으로 주어진 word의 순서
var cnt: Int = 0 // 재귀를 돌면서 하나씩 늘려가는 변수

func wordDict(_ now: String, word: String) {
	// 현재 단어와 입력으로 주어진 단어가 일치할 경우
	// res에 cnt를 담아준다.
	if now == word {
		flag = true
		res = cnt
		return
	}
	
	// 입력으로 주어진 단어에 도달 or 현재 단어(now)의 길이가 5이면 재귀를 멈춘다.
	if flag || res != 0 || now.count == 5 {
		return
	}
	
	// 현재 단어의 뒤에 A, E, I, O, U를 순서대로 붙여서 탐색해나간다.
	for i in 0..<5 {
		cnt += 1
		wordDict(now + words[i], word: word)
	}
}

func solution(_ word: String) -> Int {
	wordDict("", word: word)
	return res
}

