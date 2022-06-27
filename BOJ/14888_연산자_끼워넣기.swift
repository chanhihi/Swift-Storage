//
//  14888_연산자_끼워넣기.swift
//  
//
//  Created by Chan on 2022/06/27.
//
//	https://www.acmicpc.net/problem/14888

//	MARK: - 재귀 기본
let N = Int(readLine()!)!
let n = readLine()!.split(separator:" ").map{Int($0)!}
let oper = readLine()!.split(separator:" ").map{Int($0)!}
let maxDepth = oper.reduce(0,+)
var maxValue = -Int.max
var minValue = Int.max

func dfs(_ depth: Int, _ operation: [Int], _ value: Int,_ o: Int) {
	var operation = operation
	if depth == maxDepth {
		minValue = min(value, minValue)
		maxValue = max(value, maxValue)
		return
	}
	
	if o == 0 {
		operation[0] -= 1
	} else if o == 1 {
		operation[1] -= 1
	} else if o == 2 {
		operation[2] -= 1
	} else if o == 3 {
		operation[3] -= 1
	}
	
	if	operation[0] > 0 {
		dfs(depth + 1, operation, value + n[depth+1], 0)
	}
	if	operation[1] > 0 {
		dfs(depth + 1, operation, value - n[depth+1], 1)
	}
	if	operation[2] > 0 {
		dfs(depth + 1, operation, value * n[depth+1], 2)
	}
	if	operation[3] > 0 {
		dfs(depth + 1, operation, value / n[depth+1], 3)
	}
	
}

dfs(0, oper, n[0], 4)

print(maxValue)
print(minValue)
