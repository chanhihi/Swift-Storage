//
//  lv01_수박수박수박수박수?.swift
//  
//
//  Created by Chan on 2022/06/23.
//
//	https://programmers.co.kr/learn/courses/30/lessons/12922

// MARK: - 재귀

func solution(_ n:Int) -> String {
	var s = ""
	
	func nstr(_ n:Int) {
		if n > 0 {
			nstr(n - 1)
			n % 2 == 1 ? s.append("수") : s.append("박")
		}
	}
	nstr(n)
	return s
}
