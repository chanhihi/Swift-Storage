//
//  표편집.swift
//  
//
//  Created by Chan on 2022/04/20.
//
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
