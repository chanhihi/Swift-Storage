//
//  효율적인 화폐 구성.swift
//  algorithms
//
//  Created by 김찬희 on 2023/09/18.
//

let NM = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (N, M) = (NM[0], NM[1])
var pay = [Int]()
var dp = Array(repeating: 10001, count: M+1)

for _ in 0..<N {
    pay.append(Int(readLine()!)!)
}

dp[0] = 0

for i in 0..<N {
    for j in stride(from: pay[i], to: M+1, by: 1) {
        dp[j] = min(dp[j], dp[j - pay[i]] + 1)
    }
}

print(dp[M] == 10001 ? -1 : dp[M])
