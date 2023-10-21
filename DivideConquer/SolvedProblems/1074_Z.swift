//
//  1074_Z.swift
//  swift_practise
//
//  Created by Chan on 2023/03/15.
//
//	https://www.acmicpc.net/problem/1074
//
//	MARK: - divide & conquer / 재귀

/* note:
 * N이 15까지여서 2차원 배열이 2^15 까지 나올 수 있으므로
 * 원하는 좌표가 포함되는 행렬이 아닐 때 방문한 걸로 치고 넘어가야 한다. (시간 줄이기)
 */


let nrc = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, r, c) = (nrc[0], nrc[1], nrc[2])
var result = 0

solution(Int(pow(2.0, Double(n))), 0, 0)

func solution(_ powN: Int, _ nr: Int, _ nc: Int) {
	if nr == r && nc == c {
		print(result)
		return
	}
	if !(nr <= r && r < nr + powN && nc <= c && c < nc + powN) {
		result += powN * powN
		return
	}
	solution(powN / 2, nr, nc)
	solution(powN / 2, nr, nc + powN / 2)
	solution(powN / 2, nr + powN / 2, nc)
	solution(powN / 2, nr + powN / 2, nc + powN / 2)
}
