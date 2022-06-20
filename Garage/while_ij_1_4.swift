//
//  while_ij_1_4.swift
//  
//
//  Created by Chan on 2022/06/21.
//
//	https://velog.io/@yu-jongwon/프로그래밍-입문-1단계

import Foundation

var n = 5
var j = 1
var i = 1

while (i <= n) {
	while (j < i + 1) {
		let fs = String(format: "%3d", j)
		print (fs, terminator: "")
		j+=1
	}
	j = 1
	print("")
	i+=1
}
