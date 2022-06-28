//
//  lv02_괄호_변환.swift
//  
//
//  Created by Chan on 2022/06/27.
//
//	https://programmers.co.kr/learn/courses/30/lessons/60058

//
func solution(_ p:String) -> String {
	if p.count < 1 {return ""}	// 재귀 탈출 조건
	let p = p.map{String($0)}	// string p 를 string(map) 으로 쓰면 인덱싱 간편
	var count = 0
	var index = 0
	
	repeat{
		count += String(p[index]) == "(" ? 1 : -1
		index += 1
	} while count != 0
	
	// 위의 과정에서 알아낸 index 값을 토대로 u, v 문자열 나누기
	var u = p[..<index]
	let v = p[index...]
	
	// 올바른 괄호 문자열인지 확인
	if u[0] == "("{
		return u.joined() + solution(v.joined())
	}else{
		u.removeLast()
		u.removeFirst()
		return "(\(solution(v.joined())))\(u.map{String($0) == "(" ? ")" : "("}.joined())"
	}
}

solution("(()())()")//	"(()())()"
solution(")(")//	"()"
solution("()))((()")//	"()(())()"
