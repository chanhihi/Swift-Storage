//
//  왕실의 나이트.swift
//  algorithms
//
//  Created by 김찬희 on 2023/09/19.
//

let r: [String: Int] = ["a":1, "b":2, "c":3, "d":4, "e":5, "f":6, "g":7, "h":8]

let NM = readLine()!.map{String($0)}
let (N, M): (Int, Int) = (r[NM[0]]!, Int(NM[1])!)

let map = Array(repeating: Array(repeating: 0, count: 8), count: 8)

let dx = [2, 2, -2, -2, 1, 1, -1, -1]
let dy = [1, -1, 1, -1, 2, -2, 2, -2]

func searchNext(_ x: Int, _ y: Int) -> Int {
    var count = 0
    
    for i in 0..<8 {
        let nx = x + dx[i], ny = y + dy[i]
        if (1...8).contains(nx) && (1...8).contains(ny) {
            count += 1
        }
    }
    
    return count
}

print(searchNext(N, M))
