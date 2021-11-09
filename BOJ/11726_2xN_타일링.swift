//
//  11726_2xN_타일링.swift
//  
//
//  Created by Chan on 2021/12/03.
//
//  https://www.acmicpc.net/problem/11726

//MARK: - solution 함수

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

//MARK: - 
