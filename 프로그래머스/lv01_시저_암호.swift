//
//  lv01_시저_암호.swift
//  
//
//  Created by Chan on 2022/06/25.
//
//	https://programmers.co.kr/learn/courses/30/lessons/12926
//

//	MARK: - swift로 ascii value 제어하기
func solution(_ s:String, _ n:Int) -> String {
	var a = [String]()
	
	s.forEach {
		if $0 == " " {
			a.append(" ")
			return
		}
		var ch = $0.asciiValue! + UInt8(n)
		if $0 >= "A" && $0 <= "Z" {
			if ch > 90 {
				ch-=26
			}
		} else if $0 >= "a" && $0 <= "z" {
			if ch > 122 {
				ch-=26
			}
		}
		let n = String(UnicodeScalar(ch))
		a.append(n)
	}

	return a.joined()
}
