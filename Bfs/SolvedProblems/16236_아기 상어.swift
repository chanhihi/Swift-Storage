//
//  16236_아기 상어.swift
//  swift_practise
//
//  Created by Chan on 2023/03/03.
//
//	https://www.acmicpc.net/problem/16236
//
//	MARK: - BFS

typealias Coord = (x: Int, y: Int)
typealias EatCount = Int
typealias Size = Int

let n = Int(readLine()!)!
var map = [[Int]]()
var sharkInfo = (Coord(0, 0), Size(2), EatCount(0))
var allowedRanges = (0..<n)
var time = 0

for i in 0..<n {
	let k = readLine()!.split(separator: " ").map{Int(String($0))!}
	map.append(k)
	if k.contains(9) {
		sharkInfo.0.x = i
		sharkInfo.0.y = k.firstIndex(of: 9)!
		map[sharkInfo.0.x][sharkInfo.0.y] = 0
	}
}

func bfs() -> Bool {
	let d = [(0, -1), (-1, 0), (1, 0), (0, 1)]
	var q = [(sharkInfo.0.x, sharkInfo.0.y, 0)]
	var i = 0
	var visitedMap = Array(repeating: Array(repeating: false, count: n), count: n)
	var dist = Int.max
	var fishList = [(Int, Int)]()
	
	while q.count > i {
		let (x, y, cnt) = q[i]
		i += 1
		
		if cnt > dist {continue}
		
		if aroundCheck(x, y, sharkInfo.1) {
			dist = cnt
			fishList.append((x, y))
		}
		
		for i in 0..<4 {
			let (nx, ny) = (x+d[i].0, y+d[i].1)
			if allowedRanges.contains(nx) && allowedRanges.contains(ny) && !visitedMap[nx][ny] && map[nx][ny] <= sharkInfo.1 {
				visitedMap[nx][ny] = true
				q.append((nx,ny,cnt+1))
			}
		}
	}
	
	if fishList.isEmpty {
		return true
	}
	
	fishList.sort{
		if $0.0 == $1.0 {
			return $0.1 < $1.1
		}
		return $0.0 < $1.0
	}
	
	let target = fishList.first!
	sharkInfo.2 += 1
	
	if sharkInfo.1 == sharkInfo.2 {
		sharkInfo.1 += 1
		sharkInfo.2 = 0
	}
	
	map[target.0][target.1] = 0
	sharkInfo = ((target.0, target.1), sharkInfo.1, sharkInfo.2)
	
	time += dist
	
	return false
}

while true {
	if bfs() {
		print(time)
		break
	}
}

func aroundCheck(_ i: Int, _ j: Int, _ s: Int) -> Bool {
	if map[i][j] < s && map[i][j] != 0 { return true }
	return false
}
