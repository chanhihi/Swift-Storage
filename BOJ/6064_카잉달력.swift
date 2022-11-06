//
//  6064_카잉달력.swift
//  swift_practise
//
//  Created by Chan on 2022/11/03.
//
//	https://www.acmicpc.net/problem/6064
//
//	MARK: - 최소 공배수(lcm), 최대 공약수(gcd)

let l = Int(readLine()!)!

for _ in 0..<l {
	let r = readLine()!.split(separator: " ").map{Int(String($0))!}
	var (M, N, x, y) = (r[0], r[1], r[2], r[3])
	
	let maxYear = lcm(M, N)
	while true {
		if (x > maxYear || (x - 1) % N + 1 == y) { break }
		x += M
	}
	if (x > maxYear) {print(-1)}
	else {print(x)}
}

func gcd(_ n: Int, _ m: Int) -> Int {
	var c = 0
	var n = n
	var m = m
	
	while m != 0 {
		c = n % m
		n = m
		m = c
	}
	return n
}

func lcm(_ n: Int, _ m: Int) -> Int {
	return n * m / gcd(n, m)
}


