//
//  로또의_최고_순위와_최저_순위.swift
//  
//
//  Created by Chan on 2022/04/25.
//
//

import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    var checkLottos = Array(repeating: 0, count: 6)
    var expectLottos: [Int] = [0,0]
    
    if lottos.allSatisfy { win_nums.contains($0) } {
        return [1,1]
    } else if lottos.allSatisfy { checkLottos.contains($0) } {
        return [1,6]
    }
    
    lottos.forEach {
        if $0 == 0 { expectLottos[0] += 1 }
        else if win_nums.contains($0) { expectLottos[1] += 1 }
    }
    
    var R1 = abs(expectLottos[1]+expectLottos[0]-7) == 7 ? 6: abs(expectLottos[1]+expectLottos[0]-7)
    var R2 = abs(expectLottos[1]-7) == 7 ? 6: abs(expectLottos[1]-7)
    return [R1, R2]
}


let L = [4, 2, 3, 5, 7, 8]
let W = [31, 10, 45, 1, 6, 19]

print(solution(L, W))
print([3, 5])
