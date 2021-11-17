//
//  9465_스티커.swift
//  
//
//  Created by Chan on 2021/11/16.
//
//  https://www.acmicpc.net/problem/9465


// MARK: - file IO 사용X
for _ in 0..<Int(readLine()!)! {
    let N = Int(readLine()!)!
    var d:[[Int]] = []

    for _ in 0..<2 {
        d.append(readLine()!.split{$0==" "}.map{Int(String($0))!})
    }
    
    if N == 1 {
        print(max(d[1][0], d[0][0]))
        continue
    }
    
    d[0][1] += d[1][0]
    d[1][1] += d[0][0]

    for i in 2..<N {
        d[0][i] += max(d[1][i-1], d[1][i-2], d[0][i-2])
        d[1][i] += max(d[0][i-1], d[0][i-2], d[1][i-2])
    }

    print(max(d[0][N-1], d[1][N-1]))
}

// MARK: - file IO 사용

var file = FileIO()

for _ in 0..<file.readInt() {
    let n = file.readInt()
    var sticker = Array(repeating: Array(repeating: 0, count: n), count : 2)
    var dp = Array(repeating: Array(repeating: 0, count: n), count : 2)

    for i in 0..<2 {
        for j in 0..<n {
            sticker[i][j] = file.readInt()
        }
    }

    if n == 1 {
        print(max(sticker[0][0], sticker[1][0]))
    } else {
        dp[0][0] = sticker[0][0]
        dp[1][0] = sticker[1][0]
        dp[0][1] = dp[1][0] + sticker[0][1]
        dp[1][1] = dp[0][0] + sticker[1][1]
        for i in 2..<n {
            dp[0][i] = max(dp[1][i - 1], dp[1][i - 2]) + sticker[0][i]
            dp[1][i] = max(dp[0][i - 1], dp[0][i - 2]) + sticker[1][i]
        }

        print(max(dp[0][n - 1], dp[1][n - 1]))
    }
}
