var sum = [Int]()
var a = readLine()!.map{Int(String($0))!}
var b = readLine()!.map{Int(String($0))!}
for i in 0..<8 {
    sum.append(a[i])
    sum.append(b[i])
}

while sum.count > 2 {
    var temp = [Int]()
    for i in 0..<sum.count-1 {
        temp.append((sum[i] + sum[i+1]) % 10)
    }
    sum = temp
}

print("\(sum[0])\(sum[1])")
