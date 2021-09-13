//
//  3052_나머지.swift
//  
//
//  Created by Chan on 2021/09/13.
//

var arr = [Int]()
while let numb = readLine() { //EOF까지 입력받음
    arr.append(Int(numb)! % 42)
}

let removedDuplicate: Set = Set(arr) // 중복이 없는 set 특성 이용
print(removedDuplicate.count) //Output
