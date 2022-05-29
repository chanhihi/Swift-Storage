//
//  재귀_양궁_대회.swift
//
//
//  Created by Chan on 2021/12/05.
//
//	https://programmers.co.kr/learn/courses/30/lessons/92342

// 재풀이: 주석
// MARK: - 재귀_양궁대회
import Foundation

let SCORES = 10										// define
var highScore = 1									// 가장 높은 점수
var highScoreArray: Set<[Int]> = []					// 가장 높은 점수 배열 (세트로 중복제거)
var minArrows = Array(repeating: 0, count: 11)		// 얼마나 적은 화살 갯수로 이길 수 있는가 ?

func solution(_ n:Int, _ info:[Int]) -> [Int] {
	var apeachScore = 0
	for i in 0..<info.count {
		if info[i] > 0 {
			apeachScore += 10 - i
		}
		minArrows[i] = info[i] + 1
	}
	print(minArrows, apeachScore)
	
	for i in 0...SCORES {
		let initialArray = Array(repeating: 0, count: 11)
		takeOne(initialArray, i, n, 0, apeachScore)
	}
	print(highScore, highScoreArray)
	
	var remainSet: Set<[Int]> = []		// 중복되는 세트들 삭제하기.
	for i in stride(from: SCORES, to: 0, by: -1) {
		var nums = -1
		for array in highScoreArray {
			if (array[i] > nums) {
				nums = array[i]
				remainSet = [array]
			} else if (array[i] == nums) {
				remainSet.insert(array)
			}
		}
		if (remainSet.count == 1) {
			print(remainSet.first!)
			return remainSet.first!	// 중복 세트 중 가장 앞에 것이 정답
		}
		highScoreArray = remainSet
	}
	return [-1]
}

func takeOne(_ scoreArray: [Int], _ currentIndex: Int,_ remainArrows: Int,_ rionScore: Int, _ apeachScore: Int) {
	//    print(scoreArray, currentIndex, remainArrows, rionScore, apeachScore)
	if (currentIndex > SCORES || remainArrows < minArrows[currentIndex]) {
		if (rionScore - apeachScore > highScore) {
			highScore = rionScore - apeachScore
			var mutableScoreArray = scoreArray
			mutableScoreArray[SCORES] += remainArrows
			highScoreArray = [mutableScoreArray]
//			print(highScoreArray, rionScore, apeachScore, highScore)
		} else if rionScore - apeachScore == highScore {
			var mutableScoreArray = scoreArray
			mutableScoreArray[SCORES] += remainArrows
			highScoreArray.insert(mutableScoreArray)
		}
		return
	} else {
		let updatedRemainArrows = remainArrows - minArrows[currentIndex]
		let updatedRionScore = rionScore + 10-currentIndex
		var updatedApeachScore = apeachScore
		if (minArrows[currentIndex] > 1) {
			updatedApeachScore = apeachScore - 10 + currentIndex
		}
		var mutableScoreArray = scoreArray
		mutableScoreArray[currentIndex] += minArrows[currentIndex]
		for i in currentIndex + 1...SCORES+1 {
			takeOne(mutableScoreArray, i, updatedRemainArrows, updatedRionScore, updatedApeachScore)
		}
	}
}

//solution(9, [3,2,1,1,1,1,0,0,0,0,0])
//solution(5,	[2,1,1,1,0,0,0,0,0,0,0])//	[0,2,2,0,1,0,0,0,0,0,0]
//solution(1,	[1,0,0,0,0,0,0,0,0,0,0])//	[-1]
solution(9,	[0,0,1,2,0,1,1,1,1,1,1])//	[1,1,2,0,1,2,2,0,0,0,0]
//solution(10,	[0,0,0,0,0,0,0,0,3,4,3])//	[1,1,1,1,1,1,1,1,0,0,2]

// MARK: - 연습
import Foundation

var highestScore = 1
var highestSet: Set<[Int]> = []
var costInfo = [Int]()
var totalArrow = 0

func solution(_ n:Int, _ info:[Int]) -> [Int] {
    var apcScore = 0
    var useInfo = Array(repeating: 0, count: info.count)
    costInfo = info
    totalArrow = n
    
    for i in 0..<costInfo.count {
        if (info[i] > 0) {
            apcScore += 10 - i
        }
        costInfo[i] += 1
    }
    
    for c in 0...10 {
        cycle(n - costInfo[c], c, useInfo ,apcScore, 0)
    }
    
//    var lastIndexCheck = 0
    var highestArray = Array(highestSet)
    var hset = highestSet
    print(highestArray)
    
    for j in stride(from: 10, through: 0, by: -1){
        var lastIndexCheck = 0
        for i in 0..<highestArray.count {
            if lastIndexCheck < highestArray[i][j] {
                lastIndexCheck = highestArray[i][j]
                hset = [highestArray[i]]
            } else if lastIndexCheck == highestArray[i][j]
            {
                hset.insert(highestArray[i])
            }
        }
        highestArray = Array(hset)
        if hset.count == 1 {
            break
        }
    }
    
    if highestArray.isEmpty {
        return [-1]
    } else {
        return highestArray.first!
    }
}

func cycle(_ arrow: Int, _ currentIndex: Int, _ useInfo: [Int], _ apeachScore: Int, _ ryanScore: Int)  {
    var mutableUseInfo = useInfo
    
    if arrow < 0 || currentIndex > 10{
        let score = ryanScore - apeachScore
        
        if (highestScore < score) {
            var mutableUseInfo = useInfo
            let remainArrow = useInfo.reduce(0,+)
            mutableUseInfo[10] = totalArrow - remainArrow
            
            highestScore = score
            highestSet = [mutableUseInfo]
        } else if highestScore == score {
            var mutableUseInfo = useInfo
            let remainArrow = useInfo.reduce(0,+)
            mutableUseInfo[10] = totalArrow - remainArrow
            
            highestSet.insert(mutableUseInfo)
        }
        
        print("UseInfo", useInfo)
        print("arrow", arrow)
        print(apeachScore, ryanScore)
        return
    }
    
    var mutableRyanScore = ryanScore
    mutableRyanScore += 10 - currentIndex
    mutableUseInfo[currentIndex] += costInfo[currentIndex]
    
    var mutableApeachScore = apeachScore
    if (costInfo[currentIndex] > 1) {
        mutableApeachScore -= 10 - currentIndex
    }
    
    if currentIndex == 10  {
        return
    }
    
    for i in currentIndex+1...10 {
        cycle(arrow - costInfo[i], i, mutableUseInfo, mutableApeachScore, mutableRyanScore)
    }
}

var N = 9
var INFO = [0,0,1,2,0,1,1,1,1,1,1]
var RESULT = [1,1,2,0,1,2,2,0,0,0,0]
//
//N = 5
//INFO = [2,1,1,1,0,0,0,0,0,0,0]
//RESULT = [0,2,2,0,1,0,0,0,0,0,0]

//
//N = 10
//INFO = [0,0,0,0,0,0,0,0,3,4,3]
//RESULT = [1,1,1,1,1,1,1,1,0,0,2]

solution(N, INFO)
//print("res", RESULT)
