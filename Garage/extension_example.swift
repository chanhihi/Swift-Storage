//
//  extension_example.swift
//  
//
//  Created by Chan on 2022/05/07.
//

// MARK: - extension property

import Foundation

extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
    
    var isOdd: Bool {
        return self % 2 == 1
    }
}

print(1.isOdd)
print(2.isOdd)
print(3.isEven)
print(4.isEven)
var num = 5
print(num.isOdd)
print(num.isEven)

// MARK: - extension prefix opperator

prefix operator ++

struct Position {
    var x: Int
    var y: Int
}

extension Position {
    // + 중위 연산 구현
    static func + (left: Position, right: Position) -> Position {
        return Position(x: left.x + right.x, y: left.y + right.y)
    }
    
    // - 전위 연산 구현
    static prefix func - (vector:Position) -> Position {
        return Position(x: -vector.x, y: -vector.y)
    }
    
    // += 복합할당 연산자 구현
    static func += (left: inout Position, right: Position) {
        left = left + right
    }
}

extension Position {
    // == 비교 연산자 구현
    static func == (left: Position, right: Position) -> Bool {
        return (left.x == right.x) && (left.y == right.y)
    }
    
    // != 비교 연산자 구현
    static func != (left: Position, right: Position) -> Bool {
        return !(left == right)
    }
}

extension Position {
    // ++ 복합할당 연산자 구현
    static prefix func ++ (position: inout Position) -> Position {
        position.x += 1
        position.y += 1
        return position
    }
}

var myPosition: Position = Position(x: 10, y: 10)
var yourPosition: Position = Position(x: -5, y: -5)

print(myPosition + yourPosition)
print(-myPosition)
myPosition += yourPosition
print(myPosition)

print(myPosition == yourPosition)
print(myPosition != yourPosition)

print(++myPosition)



// MARK: - extension string subscript
extension String {
    subscript(appedValue: String) -> String? {
        return self + appedValue
    }
    
    subscript(repeatCount: UInt) ->String? {
        var str: String = ""
        
        for _ in 0..<repeatCount {
            str += self
        }
        
        return str
    }
}

print("abdf"[3])
print("ch"["an"])
