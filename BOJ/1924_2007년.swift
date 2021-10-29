//
//  1924_2007년.swift
//  
//
//  Created by Chan on 2021/10/29.
//
//  https://www.acmicpc.net/problem/1924
//

var input = readLine()!.split(separator: " ")
var date = 0
var (x, y) = (Int(input[0])!, Int(input[1])!)

switch x {
case 12 :
    date += 30
    fallthrough
case 11 :
    date += 31
    fallthrough
case 10 :
    date += 30
    fallthrough
case 9 :
    date += 31
    fallthrough
case 8 :
    date += 31
    fallthrough
case 7 :
    date += 30
    fallthrough
case 6 :
    date += 31
    fallthrough
case 5 :
    date += 30
    fallthrough
case 4 :
    date += 31
    fallthrough
case 3 :
    date += 28
    fallthrough
case 2 :
    date += 31
default :
    date = 0
}

date += y
date = date % 7

switch date {
case 1:
    print("MON")
case 2:
    print("TUE")
case 3:
    print("WED")
case 4:
    print("THU")
case 5:
    print("FRI")
case 6:
    print("SAT")
case 0:
    print("SUN")
default:
    print("NILL")
}


=====
    
//배열 사용

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let week = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
var month = input[0] - 1
let day = [0, 31, 28, 31, 30, 31 ,30, 31, 31, 30, 31, 30, 31]

print(week[(day[0...month].reduce(0,+) + input[1]) % 7])


=====

//딕셔너리 사용

import Foundation

var monthDay = readLine()!.split(separator: " ").map{ Int($0)! }
let dayOfWeak = [1:"MON", 2:"TUE", 3:"WED", 4:"THU", 5:"FRI", 6:"SAT", 0:"SUN"]
var count = 0

for i in 1...monthDay[0] {
    if i == monthDay[0] {
        count += monthDay[1]
    } else {
        if i == 1 || i == 3 || i == 5 || i == 7 || i == 8 || i == 10 || i == 12 {
            count += 31
        } else if i == 2 {
            count += 28
        } else {
            count += 30
        }
    }
}
print(dayOfWeak[count%7]!)
