//
//  9019_DSLR.swift
//  swift_practise
//
//  Created by Chan on 2023/03/03.
//
//	https://www.acmicpc.net/problem/9019
//
//	MARK: - BFS

func D(_ n: Int) -> Int { (n * 2) % 10000 }
func S(_ n: Int) -> Int { n == 0 ? 9999 : n - 1 }
func L(_ n: Int) -> Int { (n % 1000) * 10 + n / 1000 }
func R(_ n: Int) -> Int { (n % 10) * 1000 + n / 10 }

var r = Int(readLine()!)!
for _ in 0..<r {
	var visited: [Bool] = Array(repeating: false, count: 10001)
	var q: [(Int, String)] = []
	var index = 0
	let AB = readLine()!.split(separator: " ").map{Int(String($0))!}
	let (A, B) = (AB[0], AB[1])
	q.append((A, ""))
	visited[A] = true
	
	while true {
		let select = q[index]
		let start = select.0, end = B, result = select.1
		index += 1
		if start != end {
			let d = D(start)
			let s = S(start)
			let l = L(start)
			let r = R(start)
			if visited[d] == false {
				visited[d] = true
				q.append((d, result + "D"))
			}
			if visited[s] == false {
				visited[s] = true
				q.append((s, result + "S"))
			}
			if visited[l] == false {
				visited[l] = true
				q.append((l, result + "L"))
			}
			if visited[r] == false {
				visited[r] = true
				q.append((r, result + "R"))
			}
		} else {
			print(result)
			break
		}
	}
}
