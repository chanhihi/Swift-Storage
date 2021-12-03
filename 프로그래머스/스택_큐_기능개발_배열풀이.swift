//
//  스택_큐_기능개발_배열풀이.swift
//  
//
//  Created by Chan on 2021/12/04.
//
//MARK: - 스택/큐_기능개발_배열풀이
import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var remainProgresses = Array(repeating: 100, count: progresses.count)
    var completeDate = Array(repeating: 0, count: progresses.count)
    var release = [Int]()
    var releaseCount = [Int]()
    
    for i in 0..<progresses.count {
        remainProgresses[i] = remainProgresses[i] - progresses[i]
        completeDate[i] = Int(ceil(Double(remainProgresses[i]) / Double(speeds[i])))
    }
    
    print(completeDate)
    
    release.append(completeDate[0])

    for i in 1..<completeDate.count {
        print("i: ",i)
        if !release.isEmpty {
            if release.first! < completeDate[i] {
                releaseCount.append(release.count)
                print("rel", release)
                print("realC", releaseCount)
                release.removeAll()
                print("remove check",release)
                release.append(completeDate[i])
            } else {
                release.append(completeDate[i])
                print(release)
            }
        } else {
            release.append(completeDate[i])
            print(release)
        }
        
        if i == completeDate.count - 1 {
            print(i)
            if !release.isEmpty {
                releaseCount.append(release.count)
            }
        }
    }
    return releaseCount
}


var Progresses = [93, 30, 55]
var Speeds = [1, 30, 5]
var Result = [2, 1]

//Progresses = [95, 90, 99, 99, 80, 99]
//Speeds =  [1, 1, 1, 1, 1, 1]
//Result =  [1, 3, 2]

solution(Progresses, Speeds)
print(Result)

