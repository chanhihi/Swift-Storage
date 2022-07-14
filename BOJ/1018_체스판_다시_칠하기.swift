//
//  1018_체스판_다시_칠하기.swift
//  swift_practise
//
//  Created by Chan on 2022/07/15.
//
//	https://www.acmicpc.net/problem/1018

//let wb = "WBWBWBWBBWBWBWBWWBWBWBWBBWBBBWBWWBWBWBWBBWBWBWBWWBWBWBWBBWBWBWBW"
//let bw = "BWBWBWBWWBWBWBWBBWBWBWBWWBWBWBWBBWBWBWBWWBWBWBWBBWBWBWBWWBWBWBWB"

let n = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, M) = (n[0], n[1])
var board = [[String]]()

for _ in 0..<N {
	board.append(readLine()!.map{String($0)})
}

func getBoard(_ x:Int, _ y:Int) -> [[String]] {
	var check_board = [[String]]()
	for i in 0..<8 {
		check_board.append(Array(board[x+i][y..<y+8]))
	}
	return check_board
}

func repaint(_ board:[[String]]) -> Int {
	var result_bw = 0
	var result_wb = 0
//	let f = board[0][0]
	for i in 0..<8 {
		for j in 0..<8 {
			if (i + j) % 2 == 0 {
				if board[i][j] == "B" {
					result_wb += 1
				} else {
					result_bw += 1
				}
			} else {
				if board[i][j] == "W" {
					result_wb += 1
				} else {
					result_bw += 1
				}
			}
		}
	}
	return min(result_bw, result_wb)
}

var result = 64

for x in 0..<(N-7) {
	for y in 0..<(M-7) {
		let board_xy = getBoard(x, y)
		result = min(result, repaint(board_xy))
	}
}

print(result)
