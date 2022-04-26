//
//  크레인_인형뽑기_게임.swift
//  
//
//  Created by Chan on 2022/04/26.
//
//

import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var playBoard = board
    let N = playBoard.count - 1
    var basket: [Int] = []
    
    for i in 0...N {
        for j in 0...N {
            playBoard[i][j] = board[j][i]
        }
    }
    
    for i in 0...N {
        playBoard[i] = playBoard[i].reversed()
        playBoard[i].removeAll(where: {$0 == 0})
        if playBoard[i].isEmpty {
            print("board is empty",playBoard)
            return 0
        }
    }
    
    print(playBoard)
    
    for move in moves {
        basket.append(playBoard[move-1].popLast() ?? 0)
    }
    
    return doArrangeBasket(basket)
}

func doArrangeBasket (_ BASKET: [Int]) -> Int {
    var basket = BASKET
    var index = 0
    var result = 0
    basket.removeAll(where: {$0 == 0})
    
    print(basket)

    while index < basket.count - 1 {
        if basket[index] == basket[index+1] {
            basket.remove(at: index)
            basket.remove(at: index)
            result += 2
            index = 0
        } else {
            index += 1
        }
    }
    return result
}

//let B = [[1,2,3],[4,5,6],[7,8,9]]
//let B = [[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0]]
let B = [[0,0,0,0,0],[0,0,1,0,3],[0,2,5,0,1],[4,2,4,4,2],[3,5,1,3,1]]
let M = [1,5,3,5,1,2,1,4]

print(solution(B, M))
print(4)
