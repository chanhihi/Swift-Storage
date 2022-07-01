//
//  16935_배열_돌리기_3.swift
//  swift_practise
//
//  Created by Chan on 2022/07/02.
//
//	https://www.acmicpc.net/problem/16935
//	MARK: - 배열 회전 기본, 배열 돌리기

var a = readLine()!.split(separator: " ").map{Int($0)!}
let (N, M, R) = (a[0], a[1], a[2])
var bd = [[Int]]()
for _ in 0..<N {bd.append(readLine()!.split(separator: " ").map{Int($0)!})}
let progressFunc = readLine()!.split(separator: " ").map{Int($0)!}
func solution(_ R: [Int]) -> [[Int]] {
	for i in 0..<R.count {
		if R[i] == 1 {
			bd = updownfunkup(bd)
		} else if R[i] == 2 {
			bd = ababab(bd)
		} else if R[i] == 3 {
			bd = nintyRight(bd)
		} else if R[i] == 4 {
			bd = nintyLeft(bd)
		} else if R[i] == 5 {
			bd = five(bd)
		} else if R[i] == 6 {
			bd = six(bd)
		}
	}
	return bd
}

func updownfunkup (_ s:[[Int]]) -> [[Int]]{
	return s.reversed()
}

func ababab (_ s:[[Int]]) -> [[Int]]{
	var s = s
	for i in 0..<s.count {
		s[i].reverse()
	}
	return s
}

func nintyRight (_ s:[[Int]]) -> [[Int]]{
	let (m,n) = (s.count, s[0].count)
	var temp = Array(repeating: Array(repeating: 0, count: m), count: n)
	for i in 0..<n{
		for j in 0..<m{
			temp[i][j] = s[m - 1 - j][i]
		}
	}
	return temp
}

func nintyLeft (_ s:[[Int]]) -> [[Int]]{
	let (m,n) = (s.count, s[0].count)
	var temp = Array(repeating: Array(repeating: 0, count: m), count: n)
	for i in 0..<n{
		for j in 0..<m{
			temp[i][j] = s[j][n - 1 - i]
		}
	}
	return temp
}

func five (_ s:[[Int]]) -> [[Int]]{
	let (n,m) = (s.count, s[0].count)
	var temp = Array(repeating: Array(repeating: 0, count: m), count: n)
	for i in 0..<n/2{
		for j in 0..<m/2{
			temp[i][j] = s[(n / 2) + i][j]
		}
	}
	for i in 0..<n/2{
		for j in m/2..<m{
			temp[i][j] = s[i][j - (m/2)]
		}
	}
	for i in n/2..<n{
		for j in m/2..<m{
			temp[i][j] = s[i - n/2][j]
		}
	}
	for i in n/2..<n{
		for j in 0..<m/2{
			temp[i][j] = s[i][j + m/2]
		}
	}
	return temp
}

func six (_ s:[[Int]]) -> [[Int]]{
	let (n,m) = (s.count, s[0].count)
	var temp = Array(repeating: Array(repeating: 0, count: m), count: n)
	for i in n/2..<n{
		for j in 0..<m/2{
			temp[i][j] = s[i - (n / 2)][j]
		}
	}
	for i in 0..<n/2{
		for j in 0..<m/2{
			temp[i][j] = s[i][j + (m/2)]
		}
	}
	for i in 0..<n/2{
		for j in m/2..<m{
			temp[i][j] = s[i + n/2][j]
		}
	}
	for i in n/2..<n{
		for j in m/2..<m{
			temp[i][j] = s[i][j - m/2]
		}
	}
	return temp
}

func print_board (_ s: [[Int]]) {
	s.forEach{
		print($0.map{String($0)}.joined(separator: " "))
	}
}

print_board((solution(progressFunc)))
