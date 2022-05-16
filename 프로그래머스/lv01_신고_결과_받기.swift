//
//  신고_결과_받기.swift
//  
//
//  Created by Chan on 2022/04/25.
//

// MARK: -


import Foundation

//class ReportList {
//    var reportID: String
//    var banID: String
//    var count: Int
//
//    init (_ reportID: String, _ banID: String, _ count: Int){
//        self.reportID = reportID
//        self.banID = banID
//        self.count = count
//    }
//
//    func getReport() {
//        count += 1
//    }
//}

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    let removedDuplicate: Set = Set(report)
    let removedDuplicateReport = Array(removedDuplicate)
    var reportList: [String:[String:[Int]]]
    var result: [Int] = []
    
    
    
    
    
    
    return result
}


let ID_LIST = ["muzi", "frodo", "apeach", "neo"]
let REPORT = ["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"]
let K = 2

//let ID_LIST = ["con", "ryan"]
//let REPORT = ["ryan con", "ryan con", "ryan con", "ryan con"]
//let K = 3

solution(ID_LIST, REPORT, K)
print([2,1,1,0])

// MARK: -

import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
//    let removedDuplicate: Set = Set(report)
//    let removedDuplicateReport = Array(removedDuplicate)
    var reportId = [String: [String:Int]]()
    var banId: [String] = []
    var dic = [String:Int]()
    var result: [Int] = Array(repeating: 0, count: id_list.count)
    var ids: [String: Int] = [:]
    
    for (index, id) in id_list.enumerated() {
        ids[id] = index
    }
    
    dic = Dictionary(uniqueKeysWithValues: id_list.map{ (String($0), 0) })
    reportId = Dictionary(uniqueKeysWithValues: id_list.map{ (String($0), dic) })
    
//    for temp in removedDuplicateReport {
    for temp in report {
        let id = temp.split(separator: " ").map{ String($0) }
        banId.append(id[1])
    }
    
    for id in banId {
        dic[id]? += 1
        reportId.updateValue(dic, forKey: id)
    }
    
    
    print(reportId)
    print(dic)
    
    return result
}


let ID_LIST = ["muzi", "frodo", "apeach", "neo"]
let REPORT = ["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"]
let K = 2

solution(ID_LIST, REPORT, K)
print([2,1,1,0])


// MARK: - 최종 제출본

import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var reportList: [String:[String]] = [:]
    var result: [Int] = Array(repeating: 0, count: id_list.count)
    var idList: [String:Int] = [:]
    
    for (idx, id) in id_list.enumerated() {
        idList[id] = idx
    }
    
    // [신고당한놈:[신고한놈]]
    for repo in report {
        let id = repo.split(separator: " ").map { String($0) }
        let ban = id[1]
        let name = id[0]
        
        if reportList[ban] == nil {
            reportList[ban] = [name]
        } else {
            if !reportList[ban]!.contains(name) {
                reportList[ban]!.append(name)
            }
        }
    }
    
    for ID in reportList.keys {
        if reportList[ID]!.count >= k {
            for n in reportList[ID]! {
                result[idList[n]!] += 1
            }
        }
    }
    
    return result
}


let ID_LIST = ["muzi", "frodo", "apeach", "neo"]
let REPORT = ["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"]
let K = 2

print(solution(ID_LIST, REPORT, K))
print([2,1,1,0])
