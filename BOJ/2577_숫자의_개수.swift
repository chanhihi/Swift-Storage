//
//  2577_숫자의_개수.swift
//  
//
//  Created by Chan on 2021/09/13.
//

import Foundation

// BOJ
// https://www.acmicpc.net/submit/2577/33286632
// 2577번 숫자의 개수

var a = Int(readLine()!)!
var b = Int(readLine()!)!
var c = Int(readLine()!)! // 값 읽어오기 끝

var result = Array(repeating: 0, count: 10) // 출력용 배열
var multi = String(a * b * c) // Int값들의 곱

// String을 배열로보고 character에 index에 따른 값으로 result 배열 증가
for p in 1...(multi.count) {
    let index = multi.index(multi.startIndex, offsetBy: p - 1)
    result[Int(String(multi[index]))!] += 1
}

// 출력
for i in result.indices {
    print(result[i])
}
