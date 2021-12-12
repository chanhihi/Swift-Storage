//
//  짝지어_제거하기.swift
//  
//
//  Created by Chan on 2021/12/12.
//

// MARK: - 짝지어 제거하기 효율성 X

import Foundation

func solution(_ s:String) -> Int{
    var answer:Int = -1
    var String = [Character](s)
    deleteNext(&String, 0)
    
    print(String)
    
    if String.isEmpty {
        return 1
    } else {
        return 0
    }
}

func deleteNext(_ s: inout [Character], _ index: Int) {
    if index+1 >= s.count {
        return
    }
    
    if s[index] == s[index+1] {
        s.remove(at: index)
        s.remove(at: index)
        
        if index-1 < 0 {
            deleteNext(&s, index)
        } else {
        deleteNext(&s, index-1)
        }
    } else {
        deleteNext(&s, index+1)
    }
}

solution("baabaa")
