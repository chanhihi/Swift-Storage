//
//  경주로_건설.swift
//  CodeCheckProject
//
//  Created by Chan on 2022/04/25.
//
import Foundation

func solution(_ board:[[Int]]) -> Int {
    let N = board.endIndex
    let direction = [[1,0,-1,0], [0,1,0,-1]]
    var costBoard = Array(repeating: Array(repeating: Int.max, count: N), count: N)
    
    func isInside(_ row: Int, _ col: Int) -> Bool {
        if row < 0 || row >= N || col < 0 || col >= N {
            return false
        }
        return true
    }
    
    func dfs(cursor: (row: Int, col: Int, cost: Int, direction: Int)) {
        if board[cursor.row][cursor.col] == 1 || costBoard[cursor.row][cursor.col] < cursor.cost {
            return
        }
        costBoard[cursor.row][cursor.col] = cursor.cost
        
        for idx in 0..<4 {
            let nextRow = cursor.row + direction[0][idx]
            let nextCol = cursor.col + direction[1][idx]
            
            if isInside(nextRow, nextCol) {
                if cursor.direction == idx {
                    print("same", idx, cursor.cost)
                    dfs(cursor: (row:nextRow, col:nextCol, cursor.cost + 100, idx))
                } else {
                    print("diff", idx, cursor.cost)
                    dfs(cursor: (row:nextRow, col:nextCol, cursor.cost + 600, idx))
                }
            }
        }
    }
    
    costBoard[0][0] = 0
    
    dfs(cursor: (row: 1, col: 0, cost: 100, 1))
    dfs(cursor: (row: 0, col: 1, cost: 100, 2))
    
    return costBoard[N-1][N-1]
}

//var input = [[0,0,0,0,0,0,0,1],[0,0,0,0,0,0,0,0],[0,0,0,0,0,1,0,0],[0,0,0,0,1,0,0,0],[0,0,0,1,0,0,0,1],[0,0,1,0,0,0,1,0],[0,1,0,0,0,1,0,0],[1,0,0,0,0,0,0,0]]

var input = [[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]]
print(solution(input))
