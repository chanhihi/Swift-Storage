//
//  2161_카드1 .swift
//  swift_practise
//
//  Created by Chan on 2022/11/19.
//

var a = Array(1...Int(readLine()!)!)
var r = [Int]()

while (a.count != 1) {
	r.append(a.removeFirst())
	a.append(a.removeFirst())
}
r += a
print(r.map{String($0)}.joined(separator: " "))
