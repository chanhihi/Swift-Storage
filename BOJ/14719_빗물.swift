//
//  14719_빗물.swift
//  
//
//  Created by Chan on 2022/06/27.
//
//	https://www.acmicpc.net/problem/14719


//	MARK: - 구현 기본 문제

let n = readLine()!.split(separator: " ").map{Int(String($0))!}
let m = readLine()!.split(separator: " ").map{Int(String($0))!}
let (H, W) = (n[0], n[1])
let blockCount = m.count
var leftMax = Array(repeating: m[0], count: blockCount)
var rightMax = Array(repeating: m[m.count-1], count: blockCount)

for i in 1..<blockCount {
	leftMax[i] = max(leftMax[i-1], m[i])
}

for i in (0..<blockCount-1).reversed() {
	rightMax[i] = max(rightMax[i+1], m[i])
}

var dropValue = 0
for i in 1..<blockCount-1 {
	dropValue += min(leftMax[i], rightMax[i]) - m[i]
}

print(dropValue)

// MARK: - 주석 풀이
//let n = readLine()!.split(separator: " ").map{Int($0)!}
let n = "4 8".split(separator: " ").map{Int(String($0))!}
let m = "3 1 2 3 4 1 1 2".split(separator: " ").map{Int(String($0))!}
let (H, W) = (n[0], n[1])
let blockCount = m.count
var leftMax = Array(repeating: m[0], count: blockCount)	// leftMax array 첫값은 m[0]
var rightMax = Array(repeating: m[m.count-1], count: blockCount) // 첫값 m[count-1]

for i in 1..<blockCount {
	leftMax[i] = max(leftMax[i-1], m[i])	// 물을 모으기 위한 왼쪽 벽 세우기
}
print(leftMax)
for i in (0..<blockCount-1).reversed() {
	rightMax[i] = max(rightMax[i+1], m[i])	// 물을 모으기 위한 오른쪽 벽 세우기
}
print(rightMax)
var dropValue = 0
for i in 1..<blockCount-1 {	// 좌우 끝에서는 물이 모일 수 없음
	print("index:",i," water:", min(leftMax[i], rightMax[i]) - m[i])
	dropValue += min(leftMax[i], rightMax[i]) - m[i] // 넘치는 물 삭제
}

print(dropValue)
