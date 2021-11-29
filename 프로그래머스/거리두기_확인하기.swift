//
//  거리두기_확인하기.swift
//  
//
//  Created by Chan on 2021/11/29.
//
// https://programmers.co.kr/learn/courses/30/lessons/81302?language=swift

func isManhattanDistance(_ places:[[String]]) -> Bool {
    let dx = [ 1, 2, 0, 0, 1, -1]
    let dy = [0, 0, 1, 2, 1, 1]
    
    for row in 0..<5 {
        for col in 0..<5 {
            if places[row][col] == "P" {
                for i in 0..<6 {
                    let (nx, ny) = (row+dx[i], col+dy[i])

                    if (0..<5).contains(nx) && (0..<5).contains(ny) && places[nx][ny] == "P" {
                                                
                        if row == nx {
                            if ny - col == 0 {
                                return false
                            } else {
                                if places[row][col+1] != "X" {
                                    return false
                                }
                            }
                            
                        } else if col == ny {
                            if nx - row == 0 {
                                return false
                            } else {
                                if places[row+1][col] != "X" {
                                    return false
                                }
                            }
                        } else {
                            if row > nx {
                                if places[row-1][col] != "X" || places[row][col+1] != "X"{
                                    return false
                                }
                            } else {
                                if places[row+1][col] != "X" || places[row][col+1] != "X"{
                                    return false
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    return true
}

func solution(_ places:[[String]]) -> [Int] {
    let places = places.map {$0.map{$0.map{String($0)}}}
    var result:[Int] = []
    
    for place in places {
        result.append(isManhattanDistance(place) ? 1:0)
    }
    
    return result
}

let p = [["POOOP", "OXXOX", "OPXPX", "OOXOX", "POXXP"], ["POOPX", "OXPXP", "PXXXO", "OXXXO", "OOOPP"], ["PXOPX", "OXOXP", "OXPOX", "OXXOP", "PXPOX"], ["OOOXX", "XOOOX", "OOOXX", "OXOOX", "OOOOO"], ["PXPXP", "XPXPX", "PXPXP", "XPXPX", "PXPXP"]]

print(solution(p))
