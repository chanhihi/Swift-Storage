//
//  Find nearest prime.swift
//  swift_practise
//
//  Created by Chan on 2022/07/01.
//
//	https://www.codingame.com/clashofcode/clash/report/248818981e18d01ab56c4aafb7f88c46a42479a

import Foundation
var tempP = 0
var tempN = 0
var n = 2
if n < 3 {print(2)}
if isPrime(n) {print(n)}
else {
	tempP = prevPrime(n)
	tempN = nextPrime(n)
	if tempN - n < n - tempP {print(tempN)}
	else {print(tempP)}
}

func isPrime (_ n: Int) -> Bool {
	var i = 1
	while i < n/2 {
		i+=1
		if n % i == 0 { return false }
	}
	return true
}

func nextPrime (_ n: Int) -> Int {
	var n = n
	while !isPrime(n) {
		n+=1
	}
	return n
}

func prevPrime (_ n: Int) -> Int {
	var n = n
	while !isPrime(n) {
		n-=1
	}
	return n
}



//8/7

//4/3

//25/23

//45/43

//2/2

