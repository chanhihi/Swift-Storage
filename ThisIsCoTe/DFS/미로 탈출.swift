//
//  미로 탈출.swift
//  algorithms
//
//  Created by 김찬희 on 2023/09/22.
//

var board = [[Int]]()
let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n, m) = (nm[0], nm[1])

for _ in 0..<n {
    board.append(readLine()!.map{Int(String($0))!})
}

var check = board

let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

var count = 987654321

func dfs(_ x: Int, _ y: Int, _ nextCount: Int) {
    if x == m-1 && y == n-1 {
        count = min(nextCount, count)
        return
    }
    
    for i in 0..<4 {
        let nx = x + dx[i], ny = y + dy[i]
        if (0..<m).contains(nx) && (0..<n).contains(ny) && check[ny][nx] == 1 && board[ny][nx] != 0 {
            check[ny][nx] = nextCount + 1
            dfs(nx, ny, nextCount + 1)
        }
    }
}

dfs(0, 0, 1)

print(count)
