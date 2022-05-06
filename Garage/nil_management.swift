//
//  nil_management.swift
//  
//
//  Created by Chan on 2022/05/06.
//
// MARK: - for in 구문에서의 swith .some where 사용하여 특정 범위 탐색

let numbers: [Int?] = [2, nil, -4, nil, 100]

for number in numbers {
    switch number {
    case .some(let value) where value < 0:
        print("Negative value !! \(value)")
    case .some(let value) where value > 10:
        print("large value !! \(value)")
    case .some(let value):
        print("value !! \(value)")
    case .none:
        print("nil")
    }
}

// MARK: - 옵셔널값의 강제 추출

var myName: String? = "CHAN"

var chan: String = myName!

myName = nil
myName = "CHAN"
myName = chan
//chan = myNmae!

if myName != nil {
    print("my name is \(myName!)")
} else {
    print("my name is nil")
}

//MARK: - 옵셔널 바인딩 (if let / if var 구문)

var yourName: String? = nil

if let name = myName, let friend = yourName {
    print("we are friend \(name), \(friend) ")
} else {
    print("nil 값이 있다!") // friend 값이 nil 이므로 출력됨
}

yourName = "friend"

if let name = myName, let friend = yourName {
    print("we are friend \(name), \(friend) ") // 출력됨
} else {
    print("nil 값이 있다!")
}

if var name = myName {
    name = "KIM CHAN HEE "  // var이기 때문에 변경가능
    print("my name is \(name)")
} else {
    print("my name is nil")
}
