//
//  reverse.swift
//  swift_practise
//
//  Created by Chan on 2023/04/23.
//

import Glibc
import Foundation

public struct StderrOutputStream: TextOutputStream {
	public mutating func write(_ string: String) { fputs(string, stderr) }
}
public var errStream = StderrOutputStream()

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

var text = readLine()!.map{String($0)}
text.reverse()

for (i, v) in text.enumerated() {
	switch (v)
	{
		case "E": text[i] = "3"
		case "3": text[i] = "E"
		case "d": text[i] = "b"
		case "b": text[i] = "d"
		case "q": text[i] = "p"
		case "p": text[i] = "q"
		case "<": text[i] = ">"
		case ">": text[i] = "<"
		case "[": text[i] = "]"
		case "]": text[i] = "["
		case "{": text[i] = "}"
		case "}": text[i] = "{"
		case "(": text[i] = ")"
		case ")": text[i] = "("
		case "\\": text[i] = "/"
		case "/": text[i] = "\\"
		default:
			break;
	}
}

// Write an answer using print("message...")
// To debug: print("Debug messages...", to: &errStream)

print(text.joined())
