//
//  1012_유기농_배추.swift
//  swift_practise
//
//  Created by Chan on 2022/07/27.
//
//	https://www.acmicpc.net/problem/1012


//	MARK: - dfs 
let N = Int(readLine()!)!

let dx = [0,0,-1,1]
let dy = [-1,1,0,0]

for _ in 0..<N{
	let r = readLine()!.split(separator: " ").map{Int(String($0))!}
	let (farmW, farmH) = (r[0], r[1])
	let cabbageCount = r[2]
	
	var farm = Array(repeating: Array(repeating: false, count: farmW), count: farmH)
	for _ in 0..<cabbageCount{
		let positions = readLine()!.split(separator: " ").map{Int(String($0))!}
		farm[positions[1]][positions[0]] = true
	}
	
	var count = 0
	for y in 0..<farmH{
		for x in 0..<farmW{
			if farm[y][x]{
				dfs(y, x)
				count += 1
			}
		}
	}
	print(count)
	
	func dfs(_ y:Int,_ x:Int){
		if farm[y][x] {
			farm[y][x] = false
			
			for i in 0..<4 {
				let nextY = y + dy[i], nextX = x + dx[i]
				if nextY >= 0 && nextY < farmH && nextX >= 0 && nextX < farmW{
					if farm[y+dy[i]][x+dx[i]]{
						dfs(y+dy[i], x+dx[i])
					}
				}
			}
		}
	}
}
