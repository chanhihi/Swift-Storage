//
//  수식_최대화.swift
//
//
//  Created by Chan on 2022/04/22.
//
//  MARK: - NSExpression

import Foundation

let EXPRESSION: [Character] = ["+", "-", "*"]
let ORDERS: [[Character]] = [["+", "-", "*"], ["+", "*", "-"], ["-", "+", "*"], ["-", "*", "+"], ["*", "+", "-"], ["*", "-", "+"]]

func solution(_ expression:String) -> Int64 {
    var mathExpression = NSExpression(format: expression)
    var result: Int64 = mathExpression.expressionValue(with: nil, context: nil) as! Int64
    var temp:Int64 = 0
    var tempString = expression
    
    var i = 0
    var arr = Array(repeating: "", count: 1004)
    
    for c in expression {
        if c.isNumber {
            arr[i] += String(c)
        } else {
            arr[i+1] = String(c)
            i += 2
        }
    }
    
    tempString = addMulSub(arr)
    mathExpression = NSExpression(format: tempString)
    temp = mathExpression.expressionValue(with: nil, context: nil) as! Int64
    result = temp.magnitude >= result.magnitude ? Int64(temp.magnitude) : result
    
    tempString = subMulAdd(arr)
    mathExpression = NSExpression(format: tempString)
    temp = mathExpression.expressionValue(with: nil, context: nil) as! Int64
    result = temp.magnitude >= result.magnitude ? Int64(temp.magnitude) : result
    
    return Int64(result.magnitude)
}

func caculating (_ O:String, _ N1:String, _ N2:String) -> String {
    var cal:String
    cal = N1 + O + N2
    let ex = NSExpression(format: cal)
    var value = ex.expressionValue(with: nil, context: nil) as? Int
    cal = value!.codingKey.stringValue
    return cal
}

func addMulSub (_ ar:[String]) -> String{
    
    var tempString = ""
    var arr:[String]
    arr = ar

    for i in 0..<arr.count {
        if arr[i] == "+" {
            tempString = caculating("+",arr[i-1],arr[i+1])
            arr[i] = tempString
            if arr[i-1] != nil { arr[i-1] = "" }
            if arr[i+1] != nil { arr[i+1] = "" }
        }
    }
    arr = arr.filter(){$0 != ""}
    
    for i in 0..<arr.count {
        if arr[i] == "*" {
            
            tempString = caculating("*",arr[i-1],arr[i+1])
            arr[i] = tempString
            if arr[i-1] != nil { arr[i-1] = "" }
            if arr[i+1] != nil { arr[i+1] = "" }
        }
    }
    arr = arr.filter(){$0 != ""}
    
    for i in 0..<arr.count {
        if arr[i] == "-" {
            tempString = caculating("-",arr[i-1],arr[i+1])
            arr[i] = tempString
            if arr[i-1] != nil { arr[i-1] = "" }
            if arr[i+1] != nil { arr[i+1] = "" }
        }
    }
    arr = arr.filter(){$0 != ""}
    
    print(tempString)
    return tempString
}

func subMulAdd (_ ar:[String]) -> String{
    
    var tempString = ""
    var arr:[String]
    arr = ar
    
    for i in 0..<arr.count {
        if arr[i] == "-" {
            tempString = caculating("-",arr[i-1],arr[i+1])
            arr[i] = tempString
            if arr[i-1] != nil { arr[i-1] = "" }
            if arr[i+1] != nil { arr[i+1] = "" }
        }
    }
    arr = arr.filter(){$0 != ""}
    
    for i in 0..<arr.count {
        if arr[i] == "*" {
            
            tempString = caculating("*",arr[i-1],arr[i+1])
            arr[i] = tempString
            if arr[i-1] != nil { arr[i-1] = "" }
            if arr[i+1] != nil { arr[i+1] = "" }
        }
    }
    arr = arr.filter(){$0 != ""}
    
    for i in 0..<arr.count {
        if arr[i] == "+" {
            tempString = caculating("+",arr[i-1],arr[i+1])
            arr[i] = tempString
            if arr[i-1] != nil { arr[i-1] = "" }
            if arr[i+1] != nil { arr[i+1] = "" }
        }
    }
    
    arr = arr.filter(){$0 != ""}
    print(tempString)
    return tempString
}

var sik = "100-200*300-500+20"
print(solution(sik))

// MARK: - While > index 값 돌때마다 체크 / Array +-* 가능성 모두 체크

//
//  수식_최대화.swift
//
//
//  Created by Chan on 2022/04/22.
//

import Foundation

let EXPRESSION: [Character] = ["+", "-", "*"]
let ORDERS: [[Character]] = [["+", "-", "*"], ["+", "*", "-"], ["-", "+", "*"], ["-", "*", "+"], ["*", "+", "-"], ["*", "-", "+"]]

func solution(_ expression:String) -> Int64 {
    var result:Int64 = 0
    var exp = [Character]()
    let numbers = expression.split{ EXPRESSION.contains($0) }.map{ Int64($0) ?? 1 }
    
    expression.forEach {
        if EXPRESSION.contains($0) {
            exp.append($0)
        }
    }
    
    for order in ORDERS {
        result = max(abs(doCalculate(order, numbers, exp)), result)
    }
    
    return result
}

func doCalculate(_ order: [Character],_ numberArray: [Int64],_ expressionArray: [Character]) -> Int64 {
    var mutateNumberArray = numberArray
    var mutateExpressionArray = expressionArray
    
    for doExpression in order {
        var index = 0
        while index < mutateExpressionArray.count {
            if (mutateExpressionArray[index] == doExpression) {
                switch doExpression {
                case "+" :
                    mutateNumberArray[index] = mutateNumberArray[index] + mutateNumberArray[index + 1];
                case "-" :
                    mutateNumberArray[index] = mutateNumberArray[index] - mutateNumberArray[index + 1];
                default :
                    mutateNumberArray[index] = mutateNumberArray[index] * mutateNumberArray[index + 1];
                }
                mutateNumberArray.remove(at: index + 1)
                mutateExpressionArray.remove(at: index)
            } else {
                index += 1
            }
        }
    }
    return mutateNumberArray[0]
}


var sik = "50*6-3*2"
print(solution(sik))
