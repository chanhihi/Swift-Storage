//
//  미로 탈출 BFS.swift
//  algorithms
//
//  Created by 김찬희 on 2023/09/25.
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

func bfs() {
    var queue = [(Int, Int)]()
    var index = 0
    var count = 0
    
    check[0][0] = 0
    queue.append(contentsOf: checkAround(0, 0))
    
    while index < queue.count {
        print(queue[index])
        queue.append(contentsOf: checkAround(queue[index].0, queue[index].1))
        if board[queue[index].1][queue[index].0] == 1 {
            board[queue[index].1][queue[index].0] = count
            count += 1
        }
        index += 1
    }
}

func checkAround(_ x: Int, _ y: Int) -> [(Int, Int)] {
    var storage = [(Int, Int)]()
    
    for i in 0..<4 {
        let nx = dx[i] + x, ny = dy[i] + y
        if (0..<m).contains(nx) && (0..<n).contains(ny) && board[ny][nx] != 0 && check[ny][nx] != 0 {
            check[ny][nx] = 0
            storage.append((nx, ny))
        }
    }
    
    return storage
}

bfs()
print(board[n-1][m-1])
print(board)
