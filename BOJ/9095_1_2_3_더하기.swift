//
//  9095_1_2_3_더하기.swift
//  
//
//  Created by Chan on 2021/11/10.
//

// MARK: - dp x func 사용
// 재귀 dp 사용
// 시간 8ms / 코드길이 464

let N = Int(readLine()!)!
for _ in 1...N {
    let n = Int(readLine()!)!
    var d: [Int] = [Int](repeating: 0, count: n+1)

    func dp(x: Int) -> Int {
        if x == 1 {
            return 1
        } else if x == 2 {
            return 2
        } else if x == 3 {
            return 4
        } else if d[x] != 0{
            return d[x]
        }
        d[x] = (dp(x: x-1) + dp(x: x-2) + dp(x: x-3)) % 10007
        return d[x]
    }
    print(dp(x: n))
}

// MARK: - DP stride명령어 사용
// Array count 1001 으로 충분한 배열을 선언해 주지 않을 시 런타임 에러
// 시간 8ms / 코드길이 295

let N = Int(readLine()!)!
for _ in 1...N {
    let n = Int(readLine()!)!
    var d = Array(repeating: 0, count: 1001)

    d[1] = 1
    d[2] = 2
    d[3] = 4

    for i in stride(from: 4, through: n, by: 1) {
        d[i] = (d[i - 1] + d[i - 2] + d[i - 3]) % 10007
    }

    print("\(d[n])")
}
