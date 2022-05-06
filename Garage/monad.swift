//
//  monad.swift
//  
//
//  Created by Chan on 2022/05/06.
//

// MARK: - 모나드

func stringToInteger(_ string: String) -> Int? {
    return Int(string)
}

func integerToString(_ integer: Int) -> String? {
    return "\(integer)"
}

var optionalString: String? = "2"

let flattenResult = optionalString.flatMap(stringToInteger)
    .flatMap(integerToString)
    .flatMap(stringToInteger)

print(flattenResult)

let mappedResult = optionalString.map(stringToInteger)

print(mappedResult)

func integerToNil(param: Int) -> String? {
    return nil
}

optionalString = "2"

var result = optionalString.flatMap(stringToInteger)
    .flatMap(integerToNil)
    .flatMap(stringToInteger)

print(result)
