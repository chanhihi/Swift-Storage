//
//  배열_1_실패율.swift
//  
//
//  Created by Chan on 2021/12/04.
//

// MARK: - 배열_1_실패율

import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var sortedStages = stages.sorted()
    var arr: [Double] = Array(repeating: 0, count: N+1)
    
    print(stages)
    print(sortedStages)
    
    for i in 1...N {
        var count = 0
        let stagesCount = sortedStages.count
        while true {
            print("for i ", i)
            if sortedStages.count > 0 && sortedStages[0] == i {
                print("check", sortedStages[0])
                count += 1
                arr[i] = Double(count) / Double(stagesCount)
                print(arr[i], count,"/", stagesCount)
                print(sortedStages[0])
                sortedStages.remove(at: 0)
                print(sortedStages)
            } else {
                break
            }
        }
    }
    
    arr.remove(at: 0)
    var rank = arr.sorted(by:>)
    print("arr",arr)
    var result = [Int]()
    print("rank",rank)
    
    for i in 0..<rank.count {
        for j in 0..<arr.count {
            if rank[i] == arr[j] {
                result.append(j+1)
                print(arr[j], j)
                arr[j] = -1
            }
        }
    }
    print(result)
    return result
}

solution(6,[2, 7, 4, 2, 6, 2, 4, 3, 3])
//solution(4,[4,4,4,4,4])
//print([3,4,2,1,5])
//print([4,1,2,3])
