//
//  while_ij_1_3.swift
//  
//
//  Created by Chan on 2022/06/21.
//
//	https://velog.io/@yu-jongwon/프로그래밍-입문-1단계

import Foundation

var n = 5
var j = 0
var i = 0

while (i < n) {
	while (j < n) {
		let fs = String(format: "%3d", (j*2) + 1 + (i * 10))
		print (fs, terminator: "")
		j+=1
	}
	j = 0
	print("")
	i+=1
}
