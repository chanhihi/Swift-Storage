//
//  2417_정수_제곱근.swift
//  
//
//  Created by Chan on 2022/06/15.
//
//https://www.acmicpc.net/problem/2417
//
//MARK: - 이분 탐색시 조심해야 할 것 -> 오버플로우

import Foundation
let input = Double(readLine()!)!

var low = 0.0
var high = input
var result = 0.0

while low <= high {
	let mid = Double(ceil(((low+high)/2))) // ceil || Int 소수점 올려주면됨.
	
	if mid * mid >= input {
		high = mid - 1
		result = mid
	}
	else { low = mid + 1 }
}

print(Int(result))
