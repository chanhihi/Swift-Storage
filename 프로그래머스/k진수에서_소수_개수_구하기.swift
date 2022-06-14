//
//  k진수에서_소수_개수_구하기.swift
//  
//
//  Created by Chan on 2022/06/14.
//

import Foundation

func	chhh_isPrime(_ nb: Int) -> Bool {
	var i: Int

	i = 2
	if (nb <= 1) { return (false) }
	while (i * i <= nb)
	{
		if (nb % i == 0) { return (false) }
		i+=1
	}
	return (true)
}

func	digitResult(_ n: [String], _ k: Int) -> Int {
	let result = n.reduce(0, { $0 * 10 + Int($1)! })
	return (result)
}

func	solution(_ n:Int, _ k:Int) -> Int {
	var count = 0
	let dToB =  String(n, radix: k)
	var checkArray: Array<String> = []
	dToB.forEach {
		if ($0 != "0") { checkArray.append(String($0)) }
		else {
			let prime = chhh_isPrime(digitResult(checkArray, k))
			if (prime) {
				count += 1
			}
			checkArray.removeAll()
		}
	}
	let prime = chhh_isPrime(digitResult(checkArray, k))
	if (prime) {
		count += 1
	}
	return count
}
