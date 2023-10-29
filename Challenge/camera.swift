// https://www.acmicpc.net/contest/problem/1136/1

let N = Int(readLine()!)!
var students: [(ci: Int, ai: Int, diff: Int, index: Int)] = []
let MOD = 998_244_353

for i in 0..<N {
    let inputs = readLine()!.split(separator: " ").map { Int($0)! }
    let ci = inputs[0]
    let ai = inputs[1]
    students.append((ci: ci, ai: ai, diff: ci - ai, index: i + 1))
}

var minOrder = students.sorted(by: { $0.diff < $1.diff }).map { $0.index }
var maxOrder = students.sorted(by: { $0.diff > $1.diff }).map { $0.index }

func calculateScore(order: [Int], students: [(ci: Int, ai: Int, diff: Int, index: Int)]) -> Int {
    var score = 0
    for i in 0..<order.count {
        let studentIndex = order[i] - 1
        let ci = students[studentIndex].ci
        let ai = students[studentIndex].ai
        score += ci * i + ai * (N - i - 1)
    }
    return score
}

func factorial(_ n: Int) -> Int {
    if n <= 1 {
        return 1
    }
    var result = 1
    for i in 1...n {
        result = (result * i) % MOD
    }
    return result
}

func calculateCount(for order: [Int], with students: [(ci: Int, ai: Int, diff: Int, index: Int)]) -> Int {
    var count = 1
    var prevDiff = students[order[0]-1].diff
    var sameDiffCount = 1
    
    for i in 1..<order.count {
        let currentDiff = students[order[i]-1].diff
        if currentDiff == prevDiff {
            sameDiffCount += 1
        } else {
            count = (count * factorial(sameDiffCount)) % MOD
            sameDiffCount = 1
        }
        prevDiff = currentDiff
    }
    count = (count * factorial(sameDiffCount)) % MOD
    return count
}

print("\(calculateScore(order: minOrder, students: students)) \(calculateCount(for: minOrder, with: students))")
print(minOrder.map { String($0) }.joined(separator: " "))
print("\(calculateScore(order: maxOrder, students: students)) \(calculateCount(for: maxOrder, with: students))")
print(maxOrder.map { String($0) }.joined(separator: " "))
