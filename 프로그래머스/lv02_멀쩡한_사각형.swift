//
//  멀쩡한_사각형.swift
//  
//
//  Created by Chan on 2021/12/06.
//
//MARK: - 멀쩡한_사각형

import Foundation

func solution(_ w:Int, _ h:Int) -> Int64{
    var answer:Int64 = 0
    var W = Int64(w)
    var H = Int64(h)
    
    if W == 1 || H == 1 {
        return 0
    }
    
    answer = W*H-(H+W-GCD(&W,&H))
    
    return answer
}

func GCD(_ a: inout Int64, _ b: inout Int64 ) -> Int64 {
    while b > 0 {
        let r = a % b
        a = b
        b = r
    }
    return a
}
