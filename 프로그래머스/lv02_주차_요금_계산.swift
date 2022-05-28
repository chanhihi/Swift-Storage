//
//  주차_요금_계산.swift
//
//
//  Created by Chan on 2021/12/04.
//
//	https://programmers.co.kr/learn/courses/30/lessons/92341?language=swift

//	재풀이: 주석
//	MARK: - 일괄 계산 하는 방법 : 주차_요금_계산 [프로그래머스 문제 정답 풀이]

import Foundation

struct TimeRecord {
	let time: String		// 시간
	let carNumber: String	// 차량번호
	let isIn: Bool			// 안에 있는지 확인
}

var FEES = [Int]()			// 요금 [배열]

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
	var carNumberSet: Set<String> = []	// 차량번호 중복 제거용 set 선언
	FEES = fees		// 변경 가능한 요금 배열 지정
	
	for recordString in records {
		let record = recordString.split(separator: " ").map { String($0) }
		carNumberSet.insert(record[1])	// 차량번호 입력.
	}
	
	let carNumberArray = Array(carNumberSet.sorted())	// 차량 번호 정렬해서 배열에 입력.
	var timeResult = Array(repeating: 0, count: carNumberArray.count)	// 시간 결과 배열 선언.
	var feesResult = timeResult	// 요금 결과 배열 선언.

	for i in 0..<carNumberArray.count {
		var prevRecord: String = ""
		var isStillIn: Bool = false
		
		for recordString in records {		// 구조체에 전부 저장.
			let record = recordString.split(separator: " ").map { String($0) }
			let timeRecord: TimeRecord = TimeRecord(time: record[0], carNumber: record[1], isIn: record[2] == "IN")
			
			if carNumberArray[i] == timeRecord.carNumber && timeRecord.isIn {
				prevRecord = timeRecord.time
				isStillIn = true
			} else if carNumberArray[i] == timeRecord.carNumber && timeRecord.isIn == false {
				timeResult[i] += storageTimeRecord(prevRecord, timeRecord.time)
				prevRecord = ""
				isStillIn = false
			}
		}
		
		if isStillIn {
			timeResult[i] += storageTimeRecord(prevRecord, "23:59")
		}
	}
	feesResult = calculateFee(timeResult)
	return feesResult
}

func storageTimeRecord (_ inTime: String, _ outTime: String) -> Int {
	let inTimeMinute = inTime.split(separator: ":").map { Int($0)! }
	let outTimeMinute = outTime.split(separator: ":").map { Int($0)! }
	let inMM = inTimeMinute[0] * 60 + inTimeMinute[1]
	let outMM = outTimeMinute[0] * 60 + outTimeMinute[1]
	let compareInOut = outMM - inMM
	
	return compareInOut
}

func calculateFee (_ time: [Int]) -> [Int] {
	var result = Array(repeating: 0, count: time.count)
	for i in 0..<time.count {
		if time[i] < FEES[0] {
			result[i] = FEES[1]
		} else {
			result[i] = FEES[1] + Int(ceil((Double(time[i] - FEES[0]) / Double(FEES[2])))) * FEES[3]
		}
	}
	return result
}

var FEESs = [180, 5000, 10, 600]
var RECORDS = ["05:34 5961 IN", "06:00 0000 IN", "06:34 0000 OUT", "07:59 5961 OUT", "07:59 0148 IN", "18:59 0000 IN", "19:09 0148 OUT", "22:59 5961 IN", "23:00 5961 OUT"]
var RESULT = [14600, 34400, 5000]

solution(FEESs, RECORDS)
//print(RESULT)

solution ([180, 5000, 10, 600], ["05:34 5961 IN", "06:00 0000 IN", "06:34 0000 OUT", "07:59 5961 OUT", "07:59 0148 IN", "18:59 0000 IN", "19:09 0148 OUT", "22:59 5961 IN", "23:00 5961 OUT"]	) // [14600, 34400, 5000]
solution ([120, 0, 60, 591],	["16:00 3961 IN","16:00 0202 IN","18:00 3961 OUT","18:00 0202 OUT","23:58 3961 IN"])//	[0, 591]
solution ([1, 461, 1, 10],	["00:00 1234 IN"])//	[14841]

// MARK: - 각각 계산하는 방법 : 주차_요금_계산
import Foundation

struct TimeRecord {
    let time: String
    let carNumber: String
    let isIn: Bool
}

var FEES = [Int]()

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    var carNumberSet: Set<String> = []
    FEES = fees
    
    for recordString in records {
        let record = recordString.split(separator: " ").map { String($0) }
        carNumberSet.insert(record[1])
    }
    
    let carNumberArray = Array(carNumberSet.sorted())
    var result = Array(repeating: 0, count: carNumberArray.count)

    print(carNumberArray)
    
    for i in 0..<carNumberArray.count {
        var prevRecord: String = ""
        var isStillIn: Bool = false
        
        for recordString in records {
            let record = recordString.split(separator: " ").map { String($0) }
            let timeRecord: TimeRecord = TimeRecord(time: record[0], carNumber: record[1], isIn: record[2] == "IN")
            
            if carNumberArray[i] == timeRecord.carNumber && timeRecord.isIn {
                prevRecord = timeRecord.time
                print(prevRecord)
                isStillIn = true
            } else if carNumberArray[i] == timeRecord.carNumber && timeRecord.isIn == false {
                //time cal
                print("carnumber: ", timeRecord.carNumber, i, "\r\nOutTime", timeRecord.time)
                result[i] += calculateFee(prevRecord, timeRecord.time)
                prevRecord = ""
                isStillIn = false
            }
        }
        
        if isStillIn {
            //time cal outtime 23:59
            print("calcul 23:59 ",i)
            result[i] += calculateFee(prevRecord, "23:59")
        }
    }
    return result
}

func calculateFee (_ inTime: String, _ outTime: String) -> Int {
    let inTimeMinute = inTime.split(separator: ":").map { Int($0)! }
    let outTimeMinute = outTime.split(separator: ":").map { Int($0)! }
    let inMM = inTimeMinute[0] * 60 + inTimeMinute[1]
    let outMM = outTimeMinute[0] * 60 + outTimeMinute[1]
    let compareInOut = outMM - inMM
    var result = 0
    
    if compareInOut < FEES[0] {
        result = FEES[1]
        print("Basic fee: ", result)

        return result
    } else {
        result = FEES[1] + (compareInOut - FEES[0])/FEES[2] * FEES[3]
    }
    
    print(inTime, outTime)
    print(inTimeMinute, outTimeMinute)
    print(inMM, outMM)
    
    print("current fee: ", result)
    return result
}

var FEESs = [180, 5000, 10, 600]
var RECORDS = ["05:34 5961 IN", "06:00 0000 IN", "06:34 0000 OUT", "07:59 5961 OUT", "07:59 0148 IN", "18:59 0000 IN", "19:09 0148 OUT", "22:59 5961 IN", "23:00 5961 OUT"]
var RESULT = [14600, 34400, 5000]

solution(FEESs, RECORDS)
//print(RESULT)

solution ([180, 5000, 10, 600], ["05:34 5961 IN", "06:00 0000 IN", "06:34 0000 OUT", "07:59 5961 OUT", "07:59 0148 IN", "18:59 0000 IN", "19:09 0148 OUT", "22:59 5961 IN", "23:00 5961 OUT"]	) // [14600, 34400, 5000]
solution ([120, 0, 60, 591],	["16:00 3961 IN","16:00 0202 IN","18:00 3961 OUT","18:00 0202 OUT","23:58 3961 IN"])//	[0, 591]
solution ([1, 461, 1, 10],	["00:00 1234 IN"])//	[14841]
