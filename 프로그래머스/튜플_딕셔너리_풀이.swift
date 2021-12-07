//
//  튜플_딕셔너리_풀이.swift
//  
//
//  Created by Chan on 2021/12/07.
//

// MARK: - 튜플_DIC_풀이 dic 사용한 풀이 사용가능
import Foundation

func solution(_ s:String) -> [Int] {
    let tupleString = s.replacingOccurrences(of: "{", with: "").replacingOccurrences(of: "}", with: "")
    let tupleArray = tupleString.split(separator: ",").map { Int($0)! }
    var tupleDic = [Int:Int]()
    var result = [Int]()
    
    for i in 0..<tupleArray.count {
        tupleDic[tupleArray[i]] = 0
    }
    
    for i in 0..<tupleArray.count {
        tupleDic[tupleArray[i]]! += 1
    }
    
    var sortDic = tupleDic.sorted(by: { $0.value > $1.value })
    print(sortDic)
    
    for (key, value) in sortDic {
        result.append(key)
    }
    return result
}

var S = "{{4,2,3},{3},{2,3,4,1},{2,3}}"

solution(S)
