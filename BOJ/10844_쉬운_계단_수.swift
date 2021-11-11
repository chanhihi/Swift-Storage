//
//  10844_쉬운_계단_수.swift
//  
//
//  Created by Chan on 2021/11/11.
//
//  https://www.acmicpc.net/problem/10844


// MARK: - dp[101][10]
//

let n = Int(readLine()!)!
var dp = Array(repeating: Array(repeating: 0, count: 10), count: 101)
var sum = 0

for i in 1...9 {
    dp[1][i] = 1
}

dp[2][0] = 1
dp[2][1] = 1
dp[2][2] = 2
dp[2][3] = 2
dp[2][4] = 2
dp[2][5] = 2
dp[2][6] = 2
dp[2][7] = 2
dp[2][8] = 2
dp[2][9] = 1

for i in stride(from: 3, through: n, by: 1) {
    for j in 0...9 {
        if j == 0 {
            dp[i][j] = dp[i - 1][j + 1] % 1000000000
        }else if j == 9{
            dp[i][j] = dp[i - 1][j - 1] % 1000000000
        }else {
            dp[i][j] = (dp[i - 1][j - 1] + dp[i - 1][j + 1]) % 1000000000
        }
    }
}

for i in 0...9 {
    sum += dp[n][i]
}

print("\(sum % 1000000000)")

// MARK: - solution 함수
// dp1[10]
// dp2[10]
// 2개 배열 사용

func solution() -> Int {
    let n = Int(readLine()!)!
    let mod = 1000000000
    if n == 1 {
        return 9
    } else {
        var result = 0
        var num1: [Int] = [Int](repeating: 1, count: 10)
        var num2: [Int] = [Int](repeating: 0, count: 10)
        num1[0] = 0
            
        for i in 1..<n {
            for j in 0..<num1.count {
                if i % 2 == 1 {
                    if j == 0 {
                        num2[0] = (num1[1]) % mod
                    } else if j == 9 {
                        num2[9] = (num1[8]) % mod
                    } else {
                        num2[j] = (num1[j+1] + num1[j-1]) % mod
                    }
                } else {
                    if j == 0 {
                        num1[0] = (num2[1]) % mod
                    } else if j == 9 {
                        num1[9] = (num2[8]) % mod
                    } else {
                        num1[j] = (num2[j+1] + num2[j-1]) % mod
                    }
                }
            }
        }
            
        if n % 2 == 1 {
            for i in num1 {
                result += i
            }
        } else {
            for i in num2 {
                result += i
            }
        }
        return result % mod
    }
}

print(solution())
