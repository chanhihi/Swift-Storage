//
//  그리디_2_조이스틱.swift
//  
//
//  Created by Chan on 2021/12/02.
//
// MARK: - (2n + total - n+1), (total - n+1)2 + n 식을 사용한 풀이
//shortestDistance = min(distance[i] * 2 + totalDistance - distance[i+1], shortestDistance)
//shortestDistance = min((totalDistance - distance[i+1]) * 2 + distance[i], shortestDistance)
import Foundation
let ALPHABET = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]

struct Path {
    let start: Int
    let end: Int
}

func solution(_ name:String) -> Int {
    var result = Array(repeating: 0, count: name.count)
    let totalDistance = name.count
    var checkZero = true
    var distance: [Int] = []
    var shortestDistance = Int.max
    
    for (index, nm) in name.enumerated() {
        var count = ALPHABET.firstIndex(of: String(nm))
        if count! > 13 {
            count = 26 - count!
        }
        result[index] += count!
        
        if count! == 0 {
            checkZero = false
        } else {
            distance.append(index)
        }
    }
    
    if result.reduce(0,+) == 0 { return 0 }
    if checkZero { return result.reduce(0,+) + name.count - 1 }
    
//    print(distance)
//    print(result)
    
    print(distance)
    
    for i in 0..<distance.count-1 {
        shortestDistance = min(distance[i] * 2 + totalDistance - distance[i+1], shortestDistance)
        shortestDistance = min((totalDistance - distance[i+1]) * 2 + distance[i], shortestDistance)
    }
    
    shortestDistance = min(distance[distance.count - 1], totalDistance - distance[0], shortestDistance)
    
//    print(shortestDistance)
    
    return result.reduce(0,+) + shortestDistance
}

//let NAME = "JEROEN" // 56
//let NAME = "AAAJAAANAABAAACAA"  // 23
//let NAME = "AAAAAAAA"  // 23
//let NAME = "JAN"  // 23
let NAME = "JANA"  // 24
//let NAME = "JAAAAAN"  // 25
print(solution(NAME))
