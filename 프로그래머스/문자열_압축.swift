import Foundation
func solution(_ s:String) -> Int { 
    let str = s.map { String($0) } 
    var minLength = str.count 
    for size in (0..<str.count / 2).reversed() {
        let cutSize = size + 1 
        var temp = [String](str[0..<cutSize]) 
        var count = -1 
        var result = [String]() 
        for index in (0..<str.count / cutSize) {
            let startIndex = index * cutSize 
            let current = [String](str[startIndex..<startIndex + cutSize]) 
            if current == temp { 
                count += 1 
                temp = current 
            } 
            else {
                if count == 0 {
                    result += temp 
                    temp = current 
                } else {
                      result += String(count + 1).map { String($0) } 
                      result += temp 
                      count = 0 
                      temp = current 
                  } 
                 } 
        } 
        if count != 0 {
            result += String(count + 1).map { String($0) } 
        } 
        
        result += temp // 남은 나머지들은 이어서 붙여준다. 
        let remains = str[(str.count / cutSize * cutSize)...] 
        result += remains 
        if result.count < minLength {
            minLength = result.count 
        } 
    } 
    return minLength 
}