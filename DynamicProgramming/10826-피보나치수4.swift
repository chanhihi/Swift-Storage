let l = Int(readLine()!)!
var a = Array(repeating: [Int](), count: 10001)
a[0] = [0]
a[1] = [1]

func add(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
    var result = [Int]()
    var carry = 0
    let maxLength = max(arr1.count, arr2.count)
    
    for i in 0..<maxLength {
        let sum = (i < arr1.count ? arr1[i] : 0) + (i < arr2.count ? arr2[i] : 0) + carry
        result.append(sum % 10)
        carry = sum / 10
    }
    
    while carry > 0 {
        result.append(carry % 10)
        carry /= 10
    }
    
    return result
}

for i in 0..<9999 {
    a[i + 2] = add(a[i], a[i + 1])
}

let result = a[l].reversed().map { String($0) }.joined()
print(result)
