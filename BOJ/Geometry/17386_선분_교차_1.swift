//
//  17386_선분_교차_1.swift
//  swift_practise
//
//  Created by Chan on 2023/02/14.
//
//	https://www.acmicpc.net/problem/17386
//
//	MARK: - Geometry

func ccw(_ p1: (Int, Int), _ p2: (Int, Int), _ p3: (Int, Int)) -> Int {
	var temp = p1.0 * p2.1 + p2.0 * p3.1 + p3.0 * p1.1
	temp = temp - p1.1 * p2.0 - p2.1 * p3.0 - p3.1 * p1.0

	if temp > 0 { return 1 }
	else if temp < 0 { return -1 }
	return 0
}

func chk(_ a: inout (Int, Int), _ b: inout (Int, Int), _ c: inout (Int, Int), _ d: inout (Int, Int) ) -> Bool {
	let abc = ccw(a, b, c)
	let abd = ccw(a, b, d)
	let cda = ccw(c, d, a)
	let cdb = ccw(c, d, b)
	
	if (abc * abd == 0 && cda * cdb == 0)
	{
		if (a > b) { swap(&a, &b) }
		if (c > d) { swap(&c, &d) }
		return a <= d && c <= b
	}
	return abc * abd <= 0 && cda * cdb <= 0
}

let i = readLine()!.split(separator: " ").map{Int(String($0))!}
let j = readLine()!.split(separator: " ").map{Int(String($0))!}

var xy1 = (i[0], i[1]), xy2 = (i[2], i[3])
var xy3 = (j[0], j[1]), xy4 = (j[2], j[3])

if chk(&xy1, &xy2, &xy3, &xy4) { print("1")}
else {print("0")}
