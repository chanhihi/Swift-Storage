//
//  sum.swift
//  swift_practise
//
//  Created by Chan on 2023/04/04.
//

/* O(n) */
func sum(_ n: Int) -> Int {
	var ret = 0
	for i in 1...n {
		ret += i
	}
	return ret
}

/* Exhaustive search */
func recursiveSum(_ n: Int) -> Int {
	if n == 1 { return 1 }
	return n + recursiveSum(n - 1)
}

/* swiftic */
func swiftSum(_ n: Int) -> Int { (1...n).reduce(0, +) }


/* Divide Conquer */
func fastSum(_ n: Int) -> Int {
	if n == 1 { return 1 }
	if n % 2 == 1 { return fastSum(n-1) + n}
	return 2*fastSum(n/2) + (n/2) * (n/2)
}

print(sum(10))
print(recursiveSum(10))
print(swiftSum(10))
