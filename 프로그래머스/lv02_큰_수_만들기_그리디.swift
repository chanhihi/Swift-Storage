//
//  그리디_2_큰_수_만들기.swift
//
//
//  Created by Chan on 2021/12/03.
//
//	https://programmers.co.kr/learn/courses/30/lessons/42883?language=swift

// MARK: - 재풀이. 스택. 다시풀어볼것

// MARK: - 그리디_2_큰_수_만들기_대천재_풀이 : 해당하는 값을 내려 받아서 가장 큰 수를 만드는 해답.

func solution(_ numberString:String, _ k:Int) -> String {
	var deleteCount = k
	var deletedStringList = [Character]()
	
	for currentChar in numberString {
		while deleteCount > 0 {
			let lastChar = deletedStringList.last
			if lastChar != nil && lastChar! < currentChar {
				deletedStringList.removeLast()
				deleteCount -= 1
			} else {
				break
			}
		}
		deletedStringList.append(currentChar)
		print(deletedStringList)
	}
	
	return deletedStringList.dropLast(deleteCount).map(String.init).joined() // 전부 다봤는데 뒤에 남은것 두개 지우면 답이 나오는 경우 때문에 dropLast를 사용.
}

// dropLast() 안에있는 갯수만큼 뒤에서 부터 삭제

//solution ("1924"	,2)//	"94"
//"1231234"	3	"3234"
solution("4177252841"	,4	)// "775841"

//
//// MARK: - 그리디_2_큰_수만들기 : 2중 for문 사용한 시간초과 고려 안한 오답.
//
//import Foundation
//
//func solution(_ number:String, _ k:Int) -> String {
//	let N = number.count
//	var numberArray = Array(repeating: 0, count: N)
//	var deleteNumberCount = k
//
//	for (index, num) in number.enumerated() {
//		numberArray[index] = num.wholeNumberValue!
//	}
//
//	var searchingIndex = 0
//
//	while deleteNumberCount != 0 {
//		var isDeleted = false
//		for i in searchingIndex..<N {
//			if (i+1) < numberArray.count && numberArray[i] < numberArray[i+1] {
//				numberArray.remove(at: i)
//				deleteNumberCount -= 1
//				isDeleted = true
//				if i != 0 { searchingIndex = i-1 }
//				else { searchingIndex = i }
//				break
//			}
//		}
//
//		if !isDeleted {
//			for _ in 0..<deleteNumberCount {
//				numberArray.removeLast()
//			}
//			break
//		}
//	}
//	let result = numberArray.map(String.init).joined()
//	return result
//}
