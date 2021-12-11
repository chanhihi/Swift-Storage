//
//  최소_직사각형.swift
//  
//
//  Created by Chan on 2021/12/11.
//

// MARK: - 최소 직사각형

import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    var x = 0
    var y = 0
    var size = sizes
    for i in 0..<size.count {
        size[i].sort()
        x = max(size[i][0],x)
        y = max(size[i][1],y)
    }
    
    return x * y
}
