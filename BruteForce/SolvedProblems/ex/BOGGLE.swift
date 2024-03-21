//
//  boggle.swift
//  swift_practise
//
//  Created by Chan on 2023/04/05.
//
//	https://www.acmicpc.net/problem/11521

/*
 * 책에 있는 boggle과 유사한 백준 문제가 있길래 풀었습니다.
 * 영어로된 문제였는데, 문제의 예외처리 부분을 제대로 이해 못해서 런타임에러가 났었고.. 문제를 제대로 이해하고 나서
 * 책과 같은 풀이 방식으로 푸니까, 시간 초과가 나서 시간초과를 해결하려고 2시간 정도 매달려서 풀었습니다.
 * 결국 안돼서 문제를 너무 어렵게 이해하고 있는거 같아서 전부 지우고 처음부터 다시 풀었습니다.
 *
 * 이 문제로 부터 배운것 :
 * 1. 문제를 잘 읽자. 이해가 안되면 다시 읽어서 이해한다.
 * 2. 문제를 너무 어렵게 생각하지말자, 코드가 복잡해진다면 디버깅하기가 어렵다.
 * 3. 코드를 너무 간략화하지도 말자, 한 줄에 다적으면 디버깅 할 때 어디에서 에러 났는지 확인하기가 어렵다.
 * 4. 시간초과가 난다면 반복문에서 break, 재귀 타기전에 검사 한 번더.
 * 5. 인덱싱 처리 잘하자. flag break 안 줘서 몇십분 삽질 함.
 */

import Foundation

let W = Int(readLine()!)!
var words = [[String]]()

for _ in 0..<W { words.append(readLine()!.map{String($0)}) }

let dx = [-1, -1, -1, 1, 1, 1, 0, 0]
let dy = [-1, 0, 1, -1, 0, 1, -1, 1]

func solution() {
	let n = Int(readLine()!)!
	if n == 0 { exit(0) }
	
	var visited = Array(repeating: Array(repeating: false, count: n), count: n)
	let initVisited = visited
	var board = [[String]]()
	for _ in 0..<n {
		board.append(readLine()!.map{String($0)})
	}
	
	var result = [[String]]()
	
	for word in words {
	outloop:for i in 0..<n {
		for j in 0..<n {
			var flag = false
			visited = initVisited
			if board[i][j] == "q" {
				if word.count >= 2 && word[0] == "q" && word[1] == "u" {
					flag = hasWord(2, i, j, word)
				}
			} else if word[0] == board[i][j] {
				flag = hasWord(1, i, j, word)
			}
			
			if (flag)
			{
				result.append(word)
				break outloop
			}
		}
	}
	}
	
	var ans = Set<String>()
	
	for result in result { ans.insert(result.joined()) }
	
	ans.sorted().forEach {
		print($0)
	}
	print("-")
	
	func hasWord(_ idx: Int, _ y: Int, _ x: Int, _ word: [String]) -> Bool {
		if idx == word.count {
			return true
		}
		visited[y][x] = true
		var flag = false
		
		for direction in 0..<8 {
			if flag { break }
			let nextY = y + dy[direction], nextX = x + dx[direction]
			if (0..<n).contains(nextY) && (0..<n).contains(nextX) && !visited[nextY][nextX] {
				if board[nextY][nextX] == "q" {
					if idx < word.count - 1 && word[idx] == "q" && word[idx + 1] == "u" {
						flag = hasWord(idx + 2, nextY, nextX, word)
					}
				}
				else if board[nextY][nextX] == word[idx] {
					flag = hasWord(idx + 1, nextY, nextX, word)
				}
			}
		}
		visited[y][x] = false
		return flag
	}
	
}

while true { solution() }
