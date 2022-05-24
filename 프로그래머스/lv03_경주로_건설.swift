//
//  경주로_건설.swift
//  CodeCheckProject
//
//  Created by Chan on 2022/04/25.
//
//	https://programmers.co.kr/learn/courses/30/lessons/67259
//	재풀이 : 주석

// MARK: - DFS

import Foundation

func solution(_ board:[[Int]]) -> Int {
	let N = board.endIndex						// N * N 판
	let direction = [[-1,1,0,0], [0,0,1,-1]]	// 갈 수 있는 방향
	var costBoard = Array(repeating: Array(repeating: Int.max, count: N), count: N)	// cost board 생성 > Int max 값으로 보드 세팅

	func isInside(_ row: Int, _ col: Int) -> Bool {		// dfs로 더 이상 들어갈 수 있는지 확인해주는 식. (보드 이동)
		if row < 0 || row >= N || col < 0 || col >= N {
			return false
		}
		return true
	}
	
	func dfs(cursor: (row: Int, col: Int, cost: Int, direction: Int)) {
		if board[cursor.row][cursor.col] == 1 || costBoard[cursor.row][cursor.col] < cursor.cost {
			return	// 해당 보드가 갈 수 없는(1)인 길일 경우 || 이미 들린 cost board 에 더 싼 비용이 있는경우 dfs 탈출.
		}
		costBoard[cursor.row][cursor.col] = cursor.cost
		
		for idx in 0..<4 {	// 4방향 전부 갈거임.
			let nextRow = cursor.row + direction[0][idx]
			let nextCol = cursor.col + direction[1][idx]
			
			if isInside(nextRow, nextCol) {
				if cursor.direction == idx {
					print("same", idx, cursor.cost)
					dfs(cursor: (row:nextRow, col:nextCol, cursor.cost + 100, idx))	// 직선도로 cost 100
				} else {
					print("diff", idx, cursor.cost)
					dfs(cursor: (row:nextRow, col:nextCol, cursor.cost + 600, idx))	// 코너 cost 600
				}
			}
		}
	}
	
	costBoard[0][0] = 0
	
	dfs(cursor: (row: 1, col: 0, cost: 100, 1))
	dfs(cursor: (row: 0, col: 1, cost: 100, 2))
	
	return costBoard[N-1][N-1]	// 마지막에 저장된 cost 반환.
}

//var input = [[0,0,0,0,0,0,0,1],[0,0,0,0,0,0,0,0],[0,0,0,0,0,1,0,0],[0,0,0,0,1,0,0,0],[0,0,0,1,0,0,0,1],[0,0,1,0,0,0,1,0],[0,1,0,0,0,1,0,0],[1,0,0,0,0,0,0,0]]

//var input = [[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]]
//print(solution(input))

//solution([[0,0,0],[0,0,0],[0,0,0]]) //	900
//solution([[0,0,0,0,0,0,0,1],[0,0,0,0,0,0,0,0],[0,0,0,0,0,1,0,0],[0,0,0,0,1,0,0,0],[0,0,0,1,0,0,0,1],[0,0,1,0,0,0,1,0],[0,1,0,0,0,1,0,0],[1,0,0,0,0,0,0,0]]) //	3800
solution([[0,0,1,0],[0,0,0,0],[0,1,0,1],[1,0,0,0]]	)//2100
//solution([[0,0,0,0,0,0],[0,1,1,1,1,0],[0,0,1,0,0,0],[1,0,0,1,0,1],[0,1,0,0,0,1],[0,0,0,0,0,0]]	)//3200


