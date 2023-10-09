//
//  BOARDCOVER.swift
//  swift_practise
//
//  Created by Chan on 2023/04/05.
//

/*
 * 책 문제 Cover Type 이해하는데 진짜 오래걸림.
 * 그래서 이해한데로 쉽게 볼 수 있게 다시 작성함.
 */

import Foundation

var coverType = [[[1,0], [0, 1]], // b
				 [[0,1], [1, 1]], // c
				 [[1,0], [1, 1]], // d
				 [[1,0], [1, -1]]]// e

var n = Int(readLine()!)!

for _ in 0..<n {
	print(solution())
}

func solution() -> Int {
	let hw = readLine()!.split(separator: " ").map{Int(String($0))!}
	let (h, w) = (hw[0], hw[1])
	var board = [[String]]()
	var sum = 0, total = -1, result = 0, flag = false
	var startX = 0, startY = 0
	
	for i in 0..<h {
		let input = readLine()!.map{String($0)}
		if !flag, let j = input.firstIndex(of: ".") {
			startX = j
			startY = i
			flag.toggle()
		}
		sum += input.filter{$0=="."}.count
		board.append(input)
	}
	if sum % 3 != 0 { return 0 }
	total = sum / 3
	
	cover(startY, startX, 0)
	return result
	
	func put(_ y: Int, _ x: Int, _ i: Int, _ c: String) -> Bool {
		for j in 0..<2 {
			let ny = y + coverType[i][j][0]
			let nx = x + coverType[i][j][1]
			if !(0..<w).contains(ny) || !(0..<w).contains(nx) { return false }
			if board[ny][nx] == c { return false }
		}
		board[y][x] = c
		for j in 0..<2 {
			let ny = y + coverType[i][j][0]
			let nx = x + coverType[i][j][1]
			board[ny][nx] = c
		}
		return true
	}
	
	func cover(_ y: Int, _ x: Int, _ count: Int) {
		if count == total {
			result += 1
			return
		}
		if board[y][x] == "#" {
			return cover(y + (x + 1) / w, (x + 1) % w, count)
		}
		for i in 0..<4 {
			if put(y, x, i, "#") {
				cover(y + (x + 1) / w, (x + 1) % w, count + 1)
				_ = put(y, x, i, ".")
			}
		}
	}
}
