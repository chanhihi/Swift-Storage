//
//  약수의_개수와_덧셈.swift
//  
//
//  Created by Chan on 2021/11/28.
//

import Foundation

func solution(_ left:Int, _ right:Int) -> Int {
    var result = 0
    
    for i in left...right {
        if divisorCount(i) {
            result += i
        } else {
            result -= i
        }
    }
    
    return result
}

func divisorCount(_ number: Int) -> Bool {
    var n = 0
    for i in 1...number {
        if number % i == 0 {
            n += 1
        }
    }
    
    return n % 2 == 0 ? true : false
}
