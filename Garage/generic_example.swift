//
//  generic_example.swift
//  
//
//  Created by Chan on 2022/05/05.
//
//MARK: - generic

struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var doubleStack: Stack<Double> = Stack<Double>()
doubleStack.push(1.0)
doubleStack.push(2.0)
doubleStack.push(3.3)
//doubleStack.pop()
print(doubleStack)

var stringStack: Stack<String> = Stack<String>()
stringStack.push("1")
stringStack.push("2")
stringStack.push("33")
//stringStack.pop()
print(stringStack)


var anyStack: Stack<Any> = Stack<Any>()
anyStack.push("1")
anyStack.push(1.0)
anyStack.push(3)
anyStack.push(true)
//anyStack.pop()
print(anyStack)

extension Stack {
    var topElement: Element? {
        return self.items.last
    }
    
    var bottomElement: Element? {
        return self.items.first
    }
}

print(doubleStack.topElement)
print(doubleStack.bottomElement)
print(stringStack.topElement)
print(stringStack.bottomElement)
print(anyStack.topElement)
print(anyStack.bottomElement)
