//
//  15596_정수_N개의_합.swift
//  
//
//  Created by Chan on 2021/10/05.
//
// https://www.acmicpc.net/problem/15596

 // MARK: - C언어 백준 내부에서는 Swift 사용 불가
long long sum(int *a, int n) {
    long long ans = 0;
    for(int i = 0; i < n ; i++) { ans += a[i]; }
    return ans;
}

// MARK: - Swift 형식 풀이
import Foundation

var N = 100
var a = [Int](1...N)
var ans = 0
a.forEach {
    ans += $0
}
return (ans)
