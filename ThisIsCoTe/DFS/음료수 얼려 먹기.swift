//
//  음료수 얼려 먹기.swift
//  algorithms
//
//  Created by 김찬희 on 2023/09/21.
//

var board = [[Int]]()
let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n, m) = (nm[0], nm[1])

for _ in 0..<n {
    board.append(readLine()!.map{Int(String($0))!})
}

var check = board

let dx = [1, 0, -1, 0]
let dy = [0, 1, 0, -1]

func dfs(_ x: Int, _ y: Int, _ nextCount: Int) {
    for i in 0..<4 {
        let nx = x + dx[i], ny = y + dy[i]
        if (0..<n).contains(nx) && (0..<m).contains(ny) && check[nx][ny] == 0 {
            check[nx][ny] = nextCount
            dfs(nx, ny, nextCount)
        }
    }
}

var count = 0

for i in 0..<n {
    for j in 0..<m {
        if check[i][j] == 0 {
            count += 1
            dfs(i, j, count)
        }
    }
}

print(count)

//input
//15 14
//00000111100000
//11111101111110
//11011101101110
//11011101100000
//11011111111111
//11011111111100
//11000000011111
//01111111111111
//00000000011111
//01111111111000
//00011111111000
//00000001111000
//11111111110011
//11100011111111
//11100011111111

//output
//8
