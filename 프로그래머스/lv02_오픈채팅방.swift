//
//  lv02_오픈채팅방.swift
//  
//
//  Created by Chan on 2022/05/16.
//
//	https://programmers.co.kr/learn/courses/30/lessons/42888?language=swift

import Foundation

func solution(_ record:[String]) -> [String] {
	var recordDic = [String:String]()
	var result = [String]()
	
	for recordList in record {
		let reco = recordList.split(separator: " ").map{String($0)}

		if reco.count == 3 {
			recordDic.updateValue(reco[2], forKey: reco[1])
		}
	}
	
	for recor in record {
		let reco = recor.split(separator: " ").map{String($0)}
		
		if reco[0] == "Enter" {
			result += ["\(recordDic[reco[1]]!)님이 들어왔습니다."]
		} else if reco[0] == "Leave" {
			result += ["\(recordDic[reco[1]]!)님이 나갔습니다."]
		}
	}
	
	return result
}
