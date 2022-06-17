//
//  1_2016년.swift
//  
//
//  Created by Chan on 2022/06/17.
//
//	https://programmers.co.kr/learn/courses/30/lessons/12901

// MARK: - reduce 사용 풀이.
func solution(_ a:Int, _ b:Int) -> String {
	let today: [String] = ["THU","FRI","SAT","SUN","MON","TUE","WED"]
	let month: [Int] = [31,29,31,30,31,30,31,31,30,31,30]
	let total = b + month[0..<a-1].reduce(0, +)

	return today[total % 7]
}

// MARK: - 하드코딩 (속도면에서 reduce 사용보다 빠름)
func solution(_ a:Int, _ b:Int) -> String {
	let today: [String] = ["THU","FRI","SAT","SUN","MON","TUE","WED"]
	var total = 0
	if (a > 1) { total += 31}
	if (a > 2) { total += 29}
	if (a > 3) { total += 31}
	if (a > 4) { total += 30}
	if (a > 5) { total += 31}
	if (a > 6) { total += 30}
	if (a > 7) { total += 31}
	if (a > 8) { total += 31}
	if (a > 9) { total += 30}
	if (a > 10) { total += 31}
	if (a > 11) { total += 30}
	total += b
	return today[total % 7]
}
