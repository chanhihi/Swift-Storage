//
//  1011_Fly_me_to_the_Alpha_Centauri.swift
//  
//
//  Created by Chan on 2021/10/21.
//
//  https://www.acmicpc.net/problem/1011

let T = Int(readLine()!)!
for _ in 1...T {
    let n = readLine()!.split(separator: " ").map { Int(String($0))! }
    var (x, y) = (n[0], n[1])
    
    let d = y-x
    var i = 1
    
    while true {
        if d <= (i*i) {
            print(i*2-1)
            break
        } else if d <= (i*(i+1)) {
            print(i*2)
            break
        }
        i += 1
    }
}
// MARK: -
//거리 N    필요 작동 수
//1    1
//2    2
//3    3
//4    3
//5    4
//6    4
//7    5
//8    5
//9    5
//10    6
//11    6
//12    6
//13    7
//14    7
//15    7
//16    7
//17    8
//18    8
//19    8
//20    8
//21    9
