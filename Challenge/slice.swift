import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let I = input[0], N = input[1], K = input[2]
let inkString = Array(readLine()!)
var stage = Array(repeating: Array(repeating: ".", count: N), count: N)
var playerPosition: (Int, Int) = (0, 0)

for i in 0..<N {
    let line = readLine()!
    for (j, char) in line.enumerated() {
        if char == "@" {
            playerPosition = (i, j)
        }
        stage[i][j] = String(char)
    }
}

let commands = readLine()!
var inkAmount = 0
var jumpCount = 0

for command in commands {
    let (y, x) = playerPosition
    switch command {
    case "U":
        if y > 0, stage[y-1][x] != "#" {
            playerPosition = (y-1, x)
        }
    case "D":
        if y < N-1, stage[y+1][x] != "#" {
            playerPosition = (y+1, x)
        }
    case "L":
        if x > 0, stage[y][x-1] != "#" {
            playerPosition = (y, x-1)
        }
    case "R":
        if x < N-1, stage[y][x+1] != "#" {
            playerPosition = (y, x+1)
        }
    case "j":
        inkAmount += 1
    case "J":
        jumpCount += 1
        let inkColor = inkString[jumpCount % I == 0 ? I-1 : jumpCount % I - 1]
        for i in 0..<N {
            for j in 0..<N {
                if abs(y-i) + abs(x-j) <= inkAmount, stage[i][j] == "#" {
                    stage[i][j] = String(inkColor)
                }
            }
        }
        inkAmount = 0
    default:
        break
    }
    stage[playerPosition.0][playerPosition.1] = "@"
}

for line in stage {
    print(line.joined())
}
