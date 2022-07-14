//
//  1920_수_찾기.swift
//  swift_practise
//
//  Created by Chan on 2022/07/15.
//
//	https://www.acmicpc.net/problem/1920

//	MARK: - 이분탐색
let x = Int(String(readLine()!))!
var arr = readLine()!.split(separator: " ").map{Int(String($0))!}
let X = readLine()
let ar = readLine()!.split(separator: " ").map{Int(String($0))!}

arr = arr.sorted()
ar.forEach{
	var low = 0
	var high = x - 1
	
	while (low <= high) {
		let mid = (low + high) / 2
		
		if $0 == arr[mid] {
			print(1)
			return
		}
		if ($0 > arr[mid]) {
			low = mid + 1
		} else {
			high = mid - 1
		}
	}
	print(0)
}
