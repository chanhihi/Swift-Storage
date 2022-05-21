//
//  행렬_테두리_회전하기.swift
//  
//
//  Created by Chan on 2021/12/13.
//
//	https://programmers.co.kr/learn/courses/30/lessons/77485?language=swift

//MARK: - 행렬 테두리 회전하기
import Foundation

func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    var result = [Int]()
    var total = Array(repeating: Array(repeating: 0, count: columns), count: rows)
    for i in 0..<rows {
        for j in 0..<columns {
            total[i][j] = (i*columns)+(j+1)
        }
    }
    print(total)
    
    for query in queries {
        result.append(rotateArray(&total, query))
        print(total)
    }
    
    return result
}
// (r1, c1, r2, c2)
func rotateArray(_ total: inout [[Int]], _ query: [Int]) -> Int {
    let (dx, dy, px, py) = (query[0]-1, query[1]-1, query[2]-1, query[3]-1)
    var temp = total[dx][dy]
    var minValue = temp

    for j in query[1]..<query[3] {
        minValue = min(minValue, total[dx][j])
        (temp, total[dx][j]) = (total[dx][j], temp)
    }
    
    for i in query[0]..<query[2] {
        minValue = min(minValue, total[i][py])
        (temp, total[i][py]) = (total[i][py], temp)
    }
    
    for j in stride(from: py-1, to: dy-1, by: -1) {
        minValue = min(minValue, total[px][j])
        (temp, total[px][j]) = (total[px][j], temp)
    }
    
    for i in stride(from: px-1, to: dx-1, by: -1) {
        minValue = min(minValue, total[i][dy])
        (temp, total[i][dy]) = (total[i][dy], temp)
    }
    return minValue
}


solution(3,5,[]) //   [1, 1, 5, 3]
//100    97    [[1,1,100,97]]    [1]


//solution(6, 6, [[1,1,2,2],[1,1,6,6],[3,3,6,6],[5,1,6,3]] ) //[8, 10, 25]
