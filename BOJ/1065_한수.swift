//
//  1065_한수.swift
//  
//
//  Created by Chan on 2021/10/04.
//
// https://www.acmicpc.net/problem/1065

import Foundation

var num = Int(readLine()!)!
var result = 0

func calculate(num : Int) -> Int {
    for x in 100...num {
        let firstNum : Float = Float(x / 100)
        let thirdNum : Float = Float(x % 10)
        let secondNum : Float = (Float(x % 100) - thirdNum)/10
        
        if((firstNum + thirdNum) / 2 == secondNum){
            result += 1
        }
    }
    return result + 99
}

switch num {
case 1...99:
    result = num
case 100...999:
    result = calculate(num: num)
default:
    result = calculate(num: 999)
}

print(result)
