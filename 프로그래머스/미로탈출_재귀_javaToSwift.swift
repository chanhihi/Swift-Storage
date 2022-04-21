//
//  미로탈출_재귀_javaToSwift.swift
//
//
//  Created by Chan on 2022/04/21.
//

import Foundation

var nodeMap = [Int: Node]()
var destination = 0
//var lowestCost = Int.max

class Node {
    var isTrap: Bool
    var roadList: [Road]
//    var shortestCost = Int.max
    
    init (isTrap: Bool, roadList: [Road]){
        self.isTrap = isTrap
        self.roadList = roadList
    }
}

class Road {
    var end: Int
    var cost: Int
    var canGo: Bool
    
    func changeCanGo(to canGo: Bool) {
        self.canGo = !canGo
    }
    
    init (end: Int, cost: Int, canGo: Bool) {
        self.end = end
        self.cost = cost
        self.canGo = canGo
    }
}


func solution(_ n:Int, _ start:Int, _ end:Int, _ roads:[[Int]], _ traps:[Int]) -> Int {
    destination = end
    
    addRoads(roads, traps)
    
    goNext(start, 0, 0)
    
    return lowestCost
}

func addRoads(_ roads: [[Int]], _ traps: [Int]) {
    for road in roads {
        if nodeMap[road[0]] != nil {
            let existRoad = nodeMap[road[0]]?.roadList.first{ $0.end == road[1] && $0.canGo}
            if existRoad != nil { // ?
                existRoad!.cost = min(existRoad!.cost, road[2])
            } else {
                nodeMap[road[0]]?.roadList.append(Road(end: road[1], cost: road[2], canGo: true))
            }
        } else {
            nodeMap[road[0]] = Node(isTrap: traps.contains(road[0]), roadList: [Road(end: road[1], cost: road[2], canGo: true)])
        }
        
        if nodeMap[road[1]] != nil {
            let existRoad = nodeMap[road[1]]?.roadList.first{ $0.end == road[0] && !$0.canGo }
            if existRoad != nil { // ?
                existRoad!.cost = min(existRoad!.cost, road[2])
            } else {
                nodeMap[road[1]]?.roadList.append(Road(end: road[0], cost: road[2], canGo: false))
            }
        } else {
            nodeMap[road[1]] = Node(isTrap:traps.contains(road[1]), roadList: [Road(end: road[0], cost: road[2], canGo: false)])
        }
    }
}

func toggleDirection(_ current: Int) {
    for road in nodeMap[current]!.roadList {
        road.changeCanGo(to: road.canGo)
        if let n = nodeMap[road.end]?.roadList.first(where: { $0.end == current }) { n.changeCanGo(to: n.canGo) }
    }
}

func goNext(_ current: Int, _ cost: Int, _ stackCount: Int){
    if destination == current {
        lowestCost = cost
        return
    }
    
    if nodeMap[current]?.shortestCost ?? Int.zero < cost {
        return
    }
    nodeMap[current]?.shortestCost = cost
    
//    if stackCount > 200 {
//        return
//    }
    
    
    let isTrap = nodeMap[current]?.isTrap == true
    
    if isTrap {
        toggleDirection(current)
    }
    
    nodeMap[current]?.roadList.forEach {
        if $0.canGo && ( cost + $0.cost < lowestCost ) {
            goNext($0.end, cost + $0.cost , stackCount + 1)
        }
    }
    
    if isTrap {
        toggleDirection(current)
    }
    
    return
}

var roads = [[1, 2, 1], [2, 3, 1], [3, 2, 1], [3, 4, 1], [4, 3, 1], [4, 5, 1], [1, 5, 10]]
var traps = [2,3]
print(solution(5, 1, 5, roads, traps))
