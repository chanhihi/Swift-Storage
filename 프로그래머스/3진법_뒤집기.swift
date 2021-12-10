//
//  3진법_뒤집기.swift
//  
//
//  Created by Chan on 2021/12/10.
//

// MARK: - 3진법 뒤집기
import Foundation

func solution(_ n:Int) -> Int {
    let three = String(n, radix: 3)
    let threeReversed = String(three.reversed())
    return Int(threeReversed, radix: 3)!
}
