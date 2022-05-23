//
//  표편집.swift
//  
//
//  Created by Chan on 2022/04/20.
//
//	https://programmers.co.kr/learn/courses/30/lessons/81303?language=swift

// MARK: - 재풀이

import Foundation

struct Profile{
    var id = 0,
    index = 0
}

func solution(_ n:Int,_ k:Int, _ cmds:[String]) -> String {
    var profileArray = [Int]()
    var stack   = [Profile]()
    var result  = ""
    var cursor  = k
    var index   = 0
    
    for i in 1...n {
        profileArray.append(i)
    }
    
    for cmd in cmds {
        let op = cmd.components(separatedBy: " ")
        
        if op[0] == "U" {
            cursor = cursor - Int(op[1])!
        } else if op[0] == "D" {
            cursor = cursor + Int(op[1])!
        } else if op[0] == "C" {
            stack.append(Profile(id:(profileArray.remove(at: cursor)), index:cursor))
            if cursor >= profileArray.count {
                cursor = profileArray.count - 1
            }
        } else if op[0] == "Z" {
            let lastStack = stack.popLast()!
            profileArray.insert(lastStack.id, at: lastStack.index)
            if profileArray[cursor] >= lastStack.id {
                cursor += 1
            }
        }
    }

    for i in 1...n {
        if (profileArray[index] == i) {
        result.append("O")
            index += 1
        } else {
            result.append("X")
        }
    }
    return result
}

solution(8,	2,	["D 2","C","U 3","C","D 4","C","U 2","Z","Z","U 1","C"])//	"OOXOXOOO"

