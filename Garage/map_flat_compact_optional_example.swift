//
//  map_flat_compact_optional_example.swift
//  
//
//  Created by Chan on 2022/05/06.
//


let optionals: [Int?] = [1, 2, nil, 5]

let mapped: [Int?] = optionals.map { $0 }
let compactMapped: [Int] = optionals.compactMap{ $0 } // compactMap을 쓰면 옵셔널값이여도 풀어서 int 로 다시 맵해줌. (닐빼줌)
print(mapped)
print(compactMapped)

let multipleContainer = [[1,2,Optional.none], [3,Optional.none], [4,5,Optional.none]]
let mappedMultipleContainer = multipleContainer.map{ $0.map{$0} }
let flatmappedMultipleContainer = multipleContainer.flatMap{ $0.compactMap{ $0 }} // flat 맵은 1차원으로 펼쳐줌, compactMap은 nil 값 없애줌

print(mappedMultipleContainer)
print(flatmappedMultipleContainer)


