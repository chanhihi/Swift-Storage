//
//  보석쇼핑.swift
//  CodeCheckProject
//
//  Created by Chan on 2022/04/22.
//
//	https://programmers.co.kr/learn/courses/30/lessons/67258?language=swift

// MARK: - 배열 풀이 같이

import Foundation

var GEMSTONE = [String]()
var basket = [String]()
var gem = [String]()
var shortestDistance: Int = 0
var startIdx = 0
var endIdx = 0
var result = [0,0]

func solution(_ gems:[String]) -> [Int] {
    gem = gems
    removedDuplicateGems(gems)
    
    fillFirst(gems)
    removeFrontUntilDone()

//    print(startIdx, endIdx,"shortest:", shortestDistance)
    result[0] += 1
    result[1] += 1
    return result
}

func removedDuplicateGems(_ gems:[String]) {
    let removedDuplicate: Set = Set(gems)
    GEMSTONE = Array(removedDuplicate)
//    print(GEMSTONE)
}

func fillFirst(_ gems:[String]) {
    while true {
        basket.append(gem[endIdx])
        if GEMSTONE.allSatisfy{ basket.contains($0) } { // 전부 만족해야 bool값 true를 반환하는 메소
            result = [startIdx, endIdx]
            shortestDistance = endIdx
            return
        }
        endIdx += 1
    }
}

func removeFrontUntilDone() {
    while true {
        let gem = basket.removeFirst()
        startIdx += 1
        if basket.contains(gem) {
            if shortestDistance > endIdx - startIdx {
                shortestDistance = endIdx - startIdx
                result = [startIdx, endIdx]
            }
        } else {
            goaheadAddGems(gem)
            return
        }
    }
}

func goaheadAddGems(_ gemstring: String) {
    while endIdx < gem.count - 1 {
        endIdx += 1
        basket.append(gem[endIdx])
        if gem[endIdx] == gemstring { // 전부 만족해야 bool값 true를 반환하는 메소
            if shortestDistance > endIdx - startIdx {
                shortestDistance = endIdx - startIdx
                result = [startIdx, endIdx]
            }
            removeFrontUntilDone()
            return
        }
    }
}

var gemmm = ["DIA", "RUBY", "RUBY", "DIA", "DIA", "EMERALD", "SAPPHIRE", "DIA", "DIA", "DIA", "DIA", "RUBY", "EMERALD", "SAPPHIRE"]
print(solution(gemmm))


// MARK: - dic 사용한 대천재의 풀이

import Foundation

var shortestIndex: ShortestIndex = ShortestIndex(start: 0, end: Int.max)
var isNeverFill = true

struct ShortestIndex{
    let start: Int
    let end: Int
    
    func getCost() -> Int {
        return end - start
    }
}

class GemPocket {
    var gemDic: [String:Int]
    
    init (gemDic: [String:Int]) {
        self.gemDic = gemDic
    }
    
    func addGem(gem: String) {
        gemDic[gem]! += 1
    }
    
    func removeGemAndReturnIfZero(gem: String) -> Bool {
        gemDic[gem]! -= 1
//        print("removed : " + gem + ", remained : " + String(gemDic[gem]!))
        if (gemDic[gem]! == 0) {
            return true
        }
        return false
    }
    
    func checkAssembleAll() -> Bool {
        return gemDic.allSatisfy{$0.value > 0}
    }
}

func solution(_ gems:[String]) -> [Int] {
    let gemPocket = GemPocket(gemDic: getGemDic(gems))
    var neededGem: String? = nil
    var startIndex: Int = 0
    var endIndex: Int = 0
    
    for gem in gems {
        if (isNeverFill) {
            gemPocket.addGem(gem: gem)
            if gemPocket.checkAssembleAll() {
                isNeverFill = false
                shortestIndex = ShortestIndex(start: startIndex, end: endIndex)
//                print("start : " + String(startIndex) + " end : " + String(endIndex))
            } else {
                endIndex += 1
                continue
            }
        } else {
            gemPocket.addGem(gem: gem)
            if (gem == neededGem) {
                neededGem = nil
                if (shortestIndex.getCost() > endIndex - startIndex) {
                    shortestIndex = ShortestIndex(start: startIndex, end: endIndex)
//                    print("start : " + String(startIndex) + " end : " + String(endIndex))
                }
            }
        }
        
        while neededGem == nil {
            let startIndexGem = gems[startIndex]
            startIndex += 1
            if (gemPocket.removeGemAndReturnIfZero(gem: startIndexGem)) {
                neededGem = startIndexGem
            } else {
//                print("!! start : " + String(startIndex) + " end : " + String(endIndex))
                if (shortestIndex.getCost() > endIndex - startIndex) {
//                    print("?? start : " + String(startIndex) + " end : " + String(endIndex))
                    shortestIndex = ShortestIndex(start: startIndex, end: endIndex)
                }
            }
        }
        endIndex += 1
    }
    
    return [shortestIndex.start + 1, shortestIndex.end + 1]
}

func getGemDic(_ gems:[String])-> [String:Int] {
    var gemSet = Set<String>()
    gems.forEach{ gemSet.insert($0) }
    var dic = [String:Int]()
    gemSet.map {
        dic[$0] = 0
    }
    return dic
}

var gemmm = ["DIA", "RUBY", "RUBY", "DIA", "DIA", "EMERALD", "SAPPHIRE", "DIA", "DIA", "DIA", "DIA", "RUBY", "EMERALD", "SAPPHIRE"]
print(solution(gemmm))


// MARK: - 최종본

import Foundation

var shortestIndex: ShortestIndex = ShortestIndex(start: 0, end: Int.max)
var isNeverFill: Bool = true

struct ShortestIndex {
    let start: Int
    let end: Int
    
    func getCost() -> Int {
        return end - start
    }
}

class GemBasket {
    var gemDic: [String:Int]
    
    init (gemDic: [String:Int]) {
        self.gemDic = gemDic
    }
    
    func addGem(gem: String) {
        gemDic[gem]! += 1
    }
    
    func removeGemAndReturnIfZero(gem: String) -> Bool {
        gemDic[gem]! -= 1
        if (gemDic[gem]! == 0) {
            return true
        }
        return false
    }
    
    func checkAssembleAll() -> Bool {
        return gemDic.allSatisfy{$0.value > 0}
    }
}
func getGemDicFirst(_ gems:[String]) -> [String:Int] {
    let removedDuplicateGems: Set = Set(gems)
    var dic = [String:Int]()
    removedDuplicateGems.map {
        dic[$0] = 0
    }
    
    // removedDuplicateGems.forEach {dic.updateValue(0, forKey: $0)} 사용시 런타임 에러
    
    return dic
}

func solution(_ gems:[String]) -> [Int] {
    let gemBasket = GemBasket(gemDic: getGemDicFirst(gems))
    var neededGem: String? = nil
    var startIndex: Int = 0
    var endIndex: Int = 0

    for gem in gems {
        if isNeverFill {
            gemBasket.addGem(gem: gem)
            if gemBasket.checkAssembleAll() {
                isNeverFill = false
                shortestIndex = ShortestIndex(start: startIndex, end: endIndex)
            } else {
                endIndex += 1
                continue
            }
        } else {
            gemBasket.addGem(gem: gem)
            if gem == neededGem {
                neededGem = nil
                if shortestIndex.getCost() > endIndex - startIndex {
                    shortestIndex = ShortestIndex(start: startIndex, end: endIndex)
                }
            }
        }
        
        while neededGem == nil {
            let startIndexGem = gems[startIndex]
            startIndex += 1
            if gemBasket.removeGemAndReturnIfZero(gem: startIndexGem) {
                neededGem = startIndexGem
            } else {
                if shortestIndex.getCost() > endIndex - startIndex {
                    shortestIndex = ShortestIndex(start: startIndex, end: endIndex)
                }
            }
        }
        endIndex += 1
    }
    return [shortestIndex.start+1, shortestIndex.end+1]
}


var gemmm = ["DIA", "RUBY", "RUBY", "DIA", "DIA", "EMERALD", "SAPPHIRE", "DIA", "DIA", "DIA", "DIA", "RUBY", "EMERALD", "SAPPHIRE"]
print(solution(gemmm))
