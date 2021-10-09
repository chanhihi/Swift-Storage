//
//  1152_단어의_개수.swift
//  
//
//  Created by Chan on 2021/10/09.
//
//    https://www.acmicpc.net/problem/1152
import Foundation

// MARK: - 최종 split > separator
print(readLine()!.split{$0==" "}.count)

// MARK: - separtator: " " 사용
print(readLine()!.split(separator: " ").count)

// MARK: - 첫안
print(readLine()!.split(separator: " ").map { String($0)}.count)
