//
//  11726_2xN_타일링.swift
//  
//
//  Created by Chan on 2021/12/03.
//
//  https://www.acmicpc.net/problem/11726

//MARK: - Top-Down solution 함수
//재귀방식

func solution(){
    let n = Int(readLine()!)!
    var d: [Int] = [Int](repeating: 0, count: n+1)
    
    func dp(x: Int) -> Int {
        if x == 1 {
            return 1
        } else if x == 2 {
            return 2
        } else if d[x] != 0{
            return d[x]
        }
        d[x] = (dp(x: x-1) + dp(x: x-2)) % 10007
        return d[x]
    }
    print(dp(x: n))
}

solution()

//MARK: - Bottom-Up 저장
//만들어두고 호출

let n = Int(readLine()!)!
var d: [Int] = [Int](repeating: 0, count: 1001)
let mod = 10007

d[1] = 1
d[2] = 2

for i in 3...1000 {
    d[i] = (d[i-1] + d[i-2]) % mod
}
print(d[n])
