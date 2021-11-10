//
//  11727_2xN_타일링2.swift
//  
//
//  Created by Chan on 2021/11/10.
//

// MARK: - dp x func 사용
// 재귀 dp 사용
// 시간 12ms / 코드길이 315

let n = Int(readLine()!)!
var d: [Int] = [Int](repeating: 0, count: n+1)

func dp(x: Int) -> Int {
    if x == 1 {
        return 1
    } else if x == 2 {
        return 3
    } else if d[x] != 0{
        return d[x]
    }
    d[x] = (dp(x: x-1) + dp(x: x-2) + dp(x: x-2)) % 10007
    return d[x]
}
print(dp(x: n))


// MARK: - DP stride명령어 사용
// Array count 1001 으로 충분한 배열을 선언해 주지 않을 시 런타임 에러
// 시간 8ms / 코드길이 205

let n = Int(readLine()!)!
var d = Array(repeating: 0, count: 1001)

d[1] = 1
d[2] = 3

for i in stride(from: 3, through: n, by: 1) {
    d[i] = (d[i - 1] + d[i - 2] + d[i - 2]) % 10007
}
print("\(d[n])")
