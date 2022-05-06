//
//  map_filter_example.swift
//  
//
//  Created by Chan on 2022/05/06.
//

let numbers = [1,2,3,4,5,6]


var doubledNumbers: [Int] = numbers.reduce(into: [1,2] ) { (result: inout[Int], next: Int) in
    print("result: \(result) next: \(next)")

    guard next.isMultiple(of: 2) else {
        return
    }
    
    print("\(result) append \(next)")
    
    result.append(next * 2)

}

print(doubledNumbers)

var fMdoubledNumbers = [1,2] + numbers.filter{$0.isMultiple(of: 2)}.map{$0 * 2}

print(fMdoubledNumbers)
