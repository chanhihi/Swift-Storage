//
//  lv01_[1차]_다트_게임.swift
//
//
//  Created by Chan on 2022/06/23.
//
//	https://programmers.co.kr/learn/courses/30/lessons/17682

// MARK: - 로직 구상
//	score array와 oper array를 따로 받아서
//	해당하는 oper를 수행할때 score array 값 수락
//	zip을 활용해서 하나의 인덱스 안에서 결과를 돌리는것이 중요.
//	split(whereSeparator:) check
//	$0.isLetter && $0.isNumber 확인.

func solution(_ dartResult:String) -> Int {
	let scoreArray = dartResult.split(whereSeparator: {$0.isLetter || $0 == "#" || $0 == "*"})
	let operArray = dartResult.split(whereSeparator: {$0.isNumber})
	var totalResult = 0
	for (i, (score, oper)) in zip(scoreArray, operArray).enumerated() {
		print(i, (score,oper))
		var result = 0
		if let score = Int(score) {
			result = oper.contains("D") ? score * score : oper.contains("T") ? score * score * score : score
		}

		if oper.contains("*") {
			result *= 2
		} else if oper.contains("#") {
			result = -result
		}
		
		if i != 2 {
			if operArray[i + 1].contains("*") {
				result *= 2
			}
		}
		totalResult += result
	}
	return totalResult
}

solution("1S2D*3T")		//37	//	11 * 2 + 22 * 2 + 33
solution("0D2S#10S")	//9		//	12 + 21 * (-1) + 101
solution("1D2S0T")		//3		//	12 + 21 + 03
solution("1S*2T*3S")	//23	//	11 * 2 * 2 + 23 * 2 + 31 스타상 중첩
solution("1D#2S*3S")	//5		//	12 * (-1) * 2 + 21 * 2 + 31 아차상에 스타상 중첩
solution("1T2D3D#")		//-4	//	13 + 22 + 32 * (-1)
solution("1D2S3T*")		//59	//	12 + 21 * 2 + 33 * 2
