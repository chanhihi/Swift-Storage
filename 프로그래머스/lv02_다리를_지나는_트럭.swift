//
//  lv02_다리를_지나는_트럭.swift
//  swift_practise
//
//  Created by Chan on 2022/07/01.
//
//	https://programmers.co.kr/learn/courses/30/lessons/42583

// 스택(stack) / 큐(queue) 조건이 있는 스택 문제
import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
	var truck_weights = truck_weights
	var stack_weight = 0
	var count = 0
	var stack = Array(repeating: 0, count: bridge_length)
	
	while !stack.isEmpty {
		stack_weight -= stack.removeFirst()
		if let tw = truck_weights.first {
			if weight >= tw + stack_weight {
				stack.append(truck_weights.removeFirst())
				stack_weight += tw
			} else {
				stack.append(0)
			}
		}
		count += 1
	}
	return count
}
