//
//  17478_재귀함수가_뭔가요?.swift
//  
//
//  Created by Chan on 2022/06/25.
//
//	https://www.acmicpc.net/problem/17478

//	MARK: - 재귀로 풀라니까 재귀로 풂

let str1 = """
어느 한 컴퓨터공학과 학생이 유명한 교수님을 찾아가 물었다.
"""
let	str2 = """
"재귀함수가 뭔가요?"
"""
let str3 = """
"잘 들어보게. 옛날옛날 한 산 꼭대기에 이세상 모든 지식을 통달한 선인이 있었어.
"""
let str4 = """
마을 사람들은 모두 그 선인에게 수많은 질문을 했고, 모두 지혜롭게 대답해 주었지.
"""
let str5 = """
그의 답은 대부분 옳았다고 하네. 그런데 어느 날, 그 선인에게 한 선비가 찾아와서 물었어."
"""
let str_ = """
____
"""
let strMain = """
"재귀함수는 자기 자신을 호출하는 함수라네"
"""
let strEnd = """
라고 답변하였지.
"""

var depth = Int(readLine()!)!
var n = 0

print(str1)
recursive_answer(n, depth)

func recursive_answer(_ n: Int, _ depth: Int) {
	if n == depth {
		str_bar(n, str2)
		str_bar(n, strMain)
		str_bar(n, strEnd)
	} else {
		str_bar(n, str2)
		str_bar(n, str3)
		str_bar(n, str4)
		str_bar(n, str5)
		recursive_answer(n + 1, depth)
		str_bar(n, strEnd)
	}
}

func str_bar(_ n: Int, _ s: String) {
	for _ in 0..<n {
		print(str_, terminator: "")
	}
	print(s)
}
