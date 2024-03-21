//
//  CLOCKSYNC.swift
//  swift_practise
//
//  Created by Chan on 2023/04/05.
//
//	CLOCKSYNC
//	어떤 스위치건 최대 세 번 이상 누를 필요가 없다. 네 번 누르면 하나도 누르지 않은 것과 동일
//	문제를 열 조각으로 나눈 후 각 조각에서 한 스위치를 누를 횟수를 정한다.
//	재귀 호출의 깊이가 정해져 있기 때문에 이 코드는 10중 for문과 동일
//	마지막 답을 출력할 때 답이 매우크다면 -1을 대신 출력하면 된다.

var INF = 9999, SWITCHES = 10, CLOCKS = 16
var switches = [[0, 1, 2],
				[3, 7, 9, 11],
				[4, 10, 14, 15],
				[0, 4, 5, 6, 7],
				[6, 7, 8, 10, 12],
				[0, 2, 14, 15],
				[3, 14, 15],
				[4, 5, 7, 14, 15],
				[1, 2, 3, 4, 5],
				[3, 4, 5, 9, 1]]
var len = [3, 4, 4, 5, 5, 4, 3, 5, 5, 5]
var res = -1, cmp = 0;
var clocks = [Int]()

func success() -> Bool {
	for i in 0..<CLOCKS {
		if clocks[i] != 12 { return false }
	}
	return true
}

func press(_ num: Int, _ cnt: Int, _ direction: Int) {
	for i in 0..<len[num] {
		var snum = switches[num][i]
		clocks[snum] = (clocks[snum] + direction * cnt - 1) % 12 + 1
		if clocks[snum] <= 0 { clocks[snum] += 12 }
	}
}

func sync(_ num: Int) {
	if num == SWITCHES {
		if (success() && (res == -1 || cmp < res)) {
			res = cmp
		}
		return
	}
	for i in 0..<4 {
		press(num, i, 3)
		cmp += i
		sync(num + 1)
		press(num, i, -3)
		cmp -= i
	}
}

func solution() {
	clocks = readLine()!.split(separator: " ").map{Int(String($0))!}
	sync(0)
	print(res)
	clocks = [Int]()
}

let n = Int(readLine()!)!
for _ in 0..<n {
	solution()
}
