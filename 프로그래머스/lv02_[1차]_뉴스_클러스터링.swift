//
//  lv02_[1차]_뉴스_클러스터링.swift
//  
//
//  Created by Chan on 2022/06/27.
//
//	https://programmers.co.kr/learn/courses/30/lessons/17677

//	MARK: - ***
func solution(_ str1:String, _ str2:String) -> Int {
	let str1Arr = Array(str1.uppercased())
	let str2Arr = Array(str2.uppercased())

	var str1cmp: [String] = []
	var str2cmp: [String] = []
	
	for i in 0..<str1Arr.count - 1 {
		if str1Arr[i].isLetter && str1Arr[i+1].isLetter{
			str1cmp.append("\(str1Arr[i])\(str1Arr[i+1])")
		}
	}
	
	for i in 0..<str2Arr.count - 1 {
		if str2Arr[i].isLetter && str2Arr[i+1].isLetter{
			str2cmp.append("\(str2Arr[i])\(str2Arr[i+1])")
		}
	}
	
	var totalCount =  str1cmp.count + str2cmp.count
	var count = 0
	
	for i in str1cmp.indices{
		for j in str2cmp.indices{
			if str1cmp[i] == str2cmp[j]{
				count += 1
				str2cmp.remove(at: j)
				break
			}
		}
	}
	
	totalCount -= count
	
	if totalCount == 0 { // 0으로 나눌수 없음 예외처리
		return 65536
	}
	else if count == 0 {
		return 0
	}
	else{
		return Int(Double(count) / Double(totalCount) * 65536)
	}
}

solution("FRANCE",	"french")//	16384
solution("handshake",	"shake hands")//	65536
solution("aa1+aa2",	"AAAA12")//	43690
solution("E=M*C^2",	"e=m*c^2")//	65536

