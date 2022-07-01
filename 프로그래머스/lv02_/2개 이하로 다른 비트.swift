//
//  2개 이하로 다른 비트.swift
//  swift_practise
//
//  Created by Chan on 2022/07/02.
//
//	짝수일 때 2진수는 끝이 무조건 0이다. 홀수일 때 2진수는 끝이 무조건 1이다.
//	2진수에서 그 다음번째로 작은 숫자를 구하려면 맨 끝에 0을 1로 바꿔주고 그 다음 숫자를 1로 바꿔주면 된다.
//https://programmers.co.kr/learn/courses/30/lessons/77885

// MARK: - d2b / b2d 함수 사용 / 2진수 
func solution(_ numbers:[Int64]) -> [Int64] {
	return numbers.map{findMinNumber(n:$0)}
}

func makeDecimalToBinary(decimal:Int64) -> String {
	return "0" + String(decimal, radix: 2)
}

func makeBinaryToDecimal(binary:String) -> Int64 {
	return Int64(binary,radix: 2)!
}

func findMinNumber(n:Int64) -> Int64 {
	var nBinary = makeDecimalToBinary(decimal: n).map{String($0)}
	for i in 0..<nBinary.count {
		if nBinary[nBinary.count - (i+1)] == "0" {
			nBinary[nBinary.count - (i+1)] = "1"
			if i != 0 {
				nBinary[nBinary.count - i] = "0"
			}
			break
		}
	}
	return makeBinaryToDecimal(binary: nBinary.joined())
}
