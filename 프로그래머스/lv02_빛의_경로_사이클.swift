//
//  빛의_경로_사이클.swift
//  
//
//  Created by Chan on 2021/12/14.
//
// MARK: - 대천재 풀이_ 해석추가본
import Foundation

func solution(_ grid:[String]) -> [Int] {
    let totalY = grid.count
    let totalX = grid[0].count
    var nodeArray = [[Node]]()
    let gridArray = grid.map{[Character]($0)}

    for y in 0..<totalY {
        var tempArray = [Node]()
        for x in 0..<totalX {
            let top: Int
            if y == 0 {
                top = totalY - 1
            } else {
                top = y - 1
            }

            let bottom: Int
            if y == totalY - 1 {
                bottom = 0
            } else {
                bottom = y + 1
            }

            let left: Int
            if x == 0 {
                left = totalX - 1
            } else {
                left = x - 1
            }

            let right: Int
            if x == totalX - 1 {
                right = 0
            } else {
                right = x + 1
            }

            let node = Node(gridArray[y][x], [Pair(y: top,x: x), Pair(y:y, x:right), Pair(y:bottom, x:x), Pair(y:y, x:left)])
            tempArray.append(node)
        }
        nodeArray.append(tempArray)
    }

    var costArray = [Int]()
    var cost: Int? = nil

    for y in 0..<totalY {
        for x in 0..<totalX {
            for z in 0...3 {
                var nextNode = nodeArray[y][x]      // 탐색할 노드
                var direction = z                   // 북동남서
                while nextNode.checked[direction] != true {     // nextNode.checked 길로 들어왔는지 확인하는 없으면 while문에서 계속
                    nextNode.checked[direction] = true

                    let nextPair = nextNode.getNextPair(direction)      // 다음 좌표. >
                    direction = nextNode.getNextDirection(direction)    // 다음 좌표 상대방에게 들어갈 방향 >
                    nextNode = nodeArray[nextPair.y][nextPair.x]        // 다음 노드

                    if (cost == nil) {      // 들어왔으면 코스트 += 1
                        cost = 1
                    } else {
                        cost! += 1
                    }
                }
                if (cost != nil) {          //
                    costArray.append(cost!)
                    cost = nil
                }
            }
        }
    }

    return costArray.sorted{$0 < $1}
}

class Node {
    var rule: Character
    var checked = Array(repeating: false, count: 4)
    var nextNodes: [Pair]

    init (_ rule: Character, _ nextNodes: [Pair]) {
        self.rule = rule
        self.nextNodes = nextNodes
    }
    func getNextPair(_ input: Int) -> Pair {    // 상대방 좌표 [내입장에서의 방향 (상하좌우)]
        switch (rule) {
        case "R":
            return nextNodes[(input + 3) % 4]
        case "L":
            return nextNodes[(input + 1) % 4]
        default:
            return nextNodes[(input + 2) % 4]
        }
    }
    func getNextDirection(_ input: Int) -> Int { // 상대방 입장에서 들어올 direction을 만들어주는 메소드
        switch (rule) {
        case "R":
            return (input + 1) % 4
        case "L":
            return (input + 3) % 4
        default:
            return input
        }
    }
}

struct Pair {
    let y: Int
    let x: Int
}

print(solution(["RS", "SR", "LS"]))

// MARK: - 빛의 경로 사이클 _ 다른사람풀이

import Foundation

struct Location:Equatable {
    var x:Int,y:Int,d:String
}

func solution(_ grid:[String]) -> [Int] {
    let dValue = ["up": (0,-1), "down": (0,1), "left": (-1,0), "right": (1,0)]
    let next:[String:[String:String]] = ["L":["down":"right", "right":"up", "up":"left", "left":"down"],"R":["down":"left", "right":"down", "left":"up", "up":"right"], "S":["down":"down","right":"right","left":"left","up":"up"]]
    var answer:[Int] = []
    let g = grid.map{$0.map{String($0)}}
    var visited = Array(repeating: Array(repeating: ["up":false,"down":false,"left":false,"right":false], count: g[0].count), count: g.count)
    
    
    for y in 0..<g.count {
        for x in 0..<g[0].count {
            for d in dValue.keys {
                let first = Location(x: x, y: y, d: d)
                var location:Location = first
                var count:Int = 0
                while true {
                    if visited[location.y][location.x][location.d]! { break }
                    visited[location.y][location.x][location.d] = true
                    count += 1
                    let direction = g[location.y][location.x]
                    location.d = next[direction]![location.d]!
                    location.x += dValue[location.d]!.0
                    location.y += dValue[location.d]!.1
                    location.x = location.x < 0 ? g[0].count-1 : location.x%g[0].count
                    location.y = location.y < 0 ? g.count-1 : location.y%g.count
                    
                    if location == first && count != 0 {
                        answer.append(count)
                        break
                    }
                }
            }
        }
    }
    return answer.sorted()
}

solution(["SL","LR"]) // [16]

//["S"]    [1,1,1,1]
//["R","R"]    [4,4]
