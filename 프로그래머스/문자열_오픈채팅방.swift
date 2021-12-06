//
//  문자열_오픈채팅방.swift
//  
//
//  Created by Chan on 2021/12/06.
//

//MARK: - 문자열_오픈채팅방

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
            result += ["\(recordDic[reco[1]])님이 들어왔습니다."]
        } else if reco[0] == "Leave" {
            result += ["\(recordDic[reco[1]])님이 나갔습니다."]
        }
    }
    return result
}


var RECORD = ["Enter uid1234 Muzi", "Enter uid4567 Prodo","Leave uid1234","Enter uid1234 Prodo","Change uid4567 Ryan"]
var RESULT = ["Prodo님이 들어왔습니다.", "Ryan님이 들어왔습니다.", "Prodo님이 나갔습니다.", "Prodo님이 들어왔습니다."]

solution(RECORD)
print(RESULT)

