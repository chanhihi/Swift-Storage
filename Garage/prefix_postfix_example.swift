//
//  prefix_postfix_example.swift
//  
//
//  Created by Chan on 2022/05/06.
//
import Foundation
prefix operator **

prefix func ** (value: Int) -> Int {
    return value * value
}

let minusFive: Int = -5
let sqrtMinusFive: Int = **minusFive

print(sqrtMinusFive)

prefix func ! (value: String) -> Bool {
    return value.isEmpty
}

var stringValue: String = "CHAN"
var isEmptyString: Bool = !stringValue

print(isEmptyString)

stringValue = ""
isEmptyString = !stringValue

print(isEmptyString)

// MARK: - 사용자 정의 전위 연산자 함수 중복 정의와의 사용

prefix func ** (value: String) -> String {
    return value + " " + value
}

let resultString: String = **"CHAN"

print(resultString) // String type Input
print(sqrtMinusFive)// Int type Input

postfix operator **

postfix func ** (value: Int) -> Int {
    return value + 10
}

let five: Int = 5
let fivePlusTen: Int = five**

print(fivePlusTen)

print(**five**)     // 전위 연산자와 후위 연산자를 함께 쓸 경우 후위 연산자 먼저 계산후 전위연산자 계산함을 알 수 있는 코드


