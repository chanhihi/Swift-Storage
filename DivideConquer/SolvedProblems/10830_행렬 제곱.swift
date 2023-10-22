//
//  10830_행렬 제곱.swift
//  swift_practise
//
//  Created by Chan on 2023/03/15.
//
//	https://www.acmicpc.net/problem/10830
//
//	MARK: - 분할 정복

var input = readLine()!.split(separator: " ").map { Int($0)! }

var (n, square) = (input[0], input[1])

var matrix = [[Int]]()
var odd = [[Int]]()

for _ in 0 ..< n { matrix.append(readLine()!.split(separator: " ").map { Int(String($0))! }) }

func printMatrix(_ matrix: [[Int]], _ n: Int) {
	
	for i in 0 ..< n {
		var line = ""
		for j in 0 ..< n {
			line += "\(matrix[i][j] % 1000) "
		}
		print(line)
	}
}

/* note:
 * 가장 단순한 행렬 곱셈 알고리즘을 사용하면 O(n³)의 시간 복잡도가 걸리므로
 * 해당 문제에 1 ≤ B ≤ 100,000,000,000에 대입된다면 절대로 시간초과가 난다.
 * 때문에 제곱의 분할 정복으로 처리해 줘야한다.책 178 ~ 180
 */

func pow(_ m: [[Int]], _ b: Int) -> [[Int]] {
	if b == 1 {
		return m
	}
	var ret = pow(m, b / 2)
	
	ret = multiple(ret, ret, n)
	
	if b % 2 == 1 {
		ret = multiple(ret, matrix, n)
	}
	return ret
}

pow(matrix, square)
printMatrix(matrix, n)

/* 이전에 풀었던 코드 */

func multiple(_ matrix_01: [[Int]], _ matrix_02: [[Int]], _ n: Int) -> [[Int]] {
	var result = Array(repeating: Array(repeating: 0, count: n), count: n)
	for i in 0 ..< n {
		for j in 0 ..< n {
			for k in 0 ..< n {
				result[i][j] += matrix_01[i][k] * matrix_02[k][j]
				result[i][j] %= 1000
			}
		}
	}
	return result
}

func _solution() {
	
	while square > 1 {
		if square % 2 == 1 {
			if odd.isEmpty { odd = matrix }
			else { odd = multiple(matrix, odd, n) }
		}
		matrix = multiple(matrix, matrix, n)
		square /= 2
	}
	
	if odd.isEmpty { printMatrix(matrix, n) }
	else {
		matrix = multiple(matrix, odd, n)
		printMatrix(matrix, n)
	}
}
