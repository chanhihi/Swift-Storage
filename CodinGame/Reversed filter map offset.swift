//
//  Reversed filter map offset.swift
//  swift_practise
//
//  Created by Chan on 2022/07/02.
//
// enumerated().filter
//	MARK: - enumerated().filter{$0.offset} // 오프셋 활용과 요소 활용 // offset element
var s = "abcdefg".reversed().map{String($0)}.enumerated().filter{$0.offset%2==0}.map{String($0.element)}
print(s)

