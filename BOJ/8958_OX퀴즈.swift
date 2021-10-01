//
//  8958_OX퀴즈.swift
//  
//
//  Created by Chan on 2021/10/02.
//
//  https://www.acmicpc.net/problem/8958

import Foundation

let n = Int(readLine()!)! // 테스트 케이스 개수

for _ in 0..<n {
    var result = 0
    var score = 0
    let line = readLine()! // 테스트 케이스
    
    for i in line { //String을 character로 받기
        if i == "O" {
            score += 1
            result += score
        }
        else { score = 0}
    }
    print(result)
}

// MARK: - Others
// 가우스의 덧셈을 활용한 코드
// 테스트 케이스 별로 split을 사용하여 'X'를 기준으로 문자를 나눈다.
// 예를들면 문자열 "OXOOXOOOO"는 "O OO OOOO"와 같이 입력된다.
// map을 통해 첫번째 문자열의 수를 count하고 그 수에 1을 더해 곱한 뒤 2로 나누어준다(가우스의 덧셈).
// 이해하기 쉽게 표현하자면 "OXOOXOOOO"는 "1 12 1234"이기 때문에 연속된 수의 합을 구하면 [1, 3, 10]이 된다는 의미다.
// 그리고 이를 reduce를 통해 모두 더해주면 14가 된다.

let n = Int(readLine()!)!
for _ in 0..<n {
  print(readLine()!.split{$0=="X"}.map{$0.count*($0.count+1)/2}.reduce(0, +))
}
