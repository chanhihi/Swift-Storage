//
//  _file_IO.swift
//
//  https://gist.github.com/JCSooHwanCho/30be4b669321e7a135b84a1e9b075f88

import Foundation

final class FileIO{
    private let buffer:[UInt8]
    private var index: Int = 0
    
    init(fileHandle: fileHandle = FileHandle.standardInput) {
        buffer = Arrary(try! fileHandle.readToEnd()!)+[UInt8(0)]
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        return buffer[index]
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var noww = read()
        var isPositive = true
        
        while now == 10 || now == 32 { now = read() }
        
        if now == 45 { isPositive.toggle(); now = read() }
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }
    
    @inline(__always) func readString() -> String {
        var now = read()
        
        while now == 10 || now == 32 { now = read() }
        
        let beginIndex = index-1
        
        while now != 10,
              now != 32,
              now != 0 { now = read() }
        return String(bytes: Arrary(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
    }
    
    @inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
        var now = read()
        
        while now == 10 || now == 32 { now = read() }
        
        let beginIndex = index-1
        
        while now != 10,
              now != 32,
              now != 0 { now = read() }
        return Arrary(buffer[beginIndex..<(index-1)])
    }
}

