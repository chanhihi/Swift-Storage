//
//  10809_알파벳_찾기.swift
//  
//
//  Created by Chan on 2021/10/06.
//
//  https://www.acmicpc.net/submit/10809/34129827

var S = readLine()!
var output = [Int](repeating: -1, count: 26)
var count = 0

for i in S {
    if output[(Int)(i.asciiValue! - 97)] == -1 { output[(Int)(i.asciiValue! - 97)] = count }
    count += 1
}

output.forEach() {
    print($0)
}

// print(output) 사용 시 오답처리


// MARK: - dictionary 생각해보기

//var dic = ["a": 0, "b": 1, "c": 2, "d": 3, "e": 4, "f": 5, "g": 6, "h": 7, "i": 8, "j": 9, "k": 10, "l": 11, "m": 12, "n": 13, "o": 14, "p": 15, "q": 16, "r": 17, "s": 18, "t": 19, "u": 20, "v": 21, "w": 22, "x": 23, "y": 24, "z": 25]

//
//S.forEach {
//    for key in dic {
//        if $0 = key {
//
//        }
//    }
//}
