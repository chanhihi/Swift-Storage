let N = Int(readLine()!)!
let MOD = 998244353
var adj = [[Int]](repeating: [], count: N + 1)

for _ in 0..<N-1 {
    let nodes = readLine()!.split(separator: " ").map { Int($0)! }
    adj[nodes[0]].append(nodes[1])
    adj[nodes[1]].append(nodes[0])
}

var dp = [[Int]](repeating: [Int](repeating: 0, count: 2), count: N + 1)

func dfs(node: Int, parent: Int) {
    dp[node][0] = 1
    dp[node][1] = 1
    for next in adj[node] {
        if next != parent {
            dfs(node: next, parent: node)
            dp[node][0] = (dp[node][0] * (dp[next][0] + dp[next][1])) % MOD
            dp[node][1] = (dp[node][1] * dp[next][0]) % MOD
        }
    }
}

dfs(node: 1, parent: 0)

let result = (dp[1][0] + MOD - dp[1][1]) % MOD
print(result)
