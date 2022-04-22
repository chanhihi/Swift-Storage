//
//  키패드_누르기_naive_풀이.swift
//  
//
//  Created by Chan on 2022/04/22.
//


var Numbers = [1, 3, 4, 5, 8, 2, 1, 4, 5, 9, 5] // 예제 input
var Hand = "right"

print("13458214595")                // input value
print(solution(Numbers, Hand))      // input
print("LRLLLRLLRRL")                // output


// MARK: - 내 풀이 > 거리 계산을 직접한다음 거리에 대한 배열값 지정
import Foundation

var lastLeft = 10
var lastRight = 11

func solution(_ numbers:[Int], _ hand:String) -> String {
    
    var distance = [[0,4,3,4,3,2,3,2,1,2],[0,0,1,2,1,2,3,2,3,4],[0,0,0,1,2,1,2,3,2,3],[0,0,0,0,3,2,1,3,3,2,4],[0,0,0,0,0,1,2,1,2,3,3],[0,0,0,0,0,0,1,2,1,2,2],[0,0,0,0,0,0,0,3,2,1,3],[0,0,0,0,0,0,0,0,1,2,2],[0,0,0,0,0,0,0,0,0,1,1],[0,0,0,0,0,0,0,0,0,2],[1,0,4,0,0,3,0,0,2,0],[1,0,4,0,0,3,0,0,2,0]]

    for i in 0..<10 {
        for j in 0..<10 {
            distance[j][i] = distance [i][j]
        }
    }
    
    var result = Array(repeating: "X", count: numbers.count)
    var index = 0
    
    for numb in numbers {
        switch numb {
        case 1,4,7 :
            result[index] = "L"
            lastLeft = numb
            break
        case 3,6,9 :
            result[index] = "R"
            lastRight = numb
            break
        default:
            result[index] = checkHand(numb, hand, distance[lastLeft][numb], distance[lastRight][numb] )
            break
        }
        index += 1
    }
    return result.joined()
}
func usedHand(_ numb:Int, _ hand:String) -> String {
    
    if hand == "left" {
        lastLeft = numb
        return "L"
    } else {
        lastRight = numb
        return "R"
    }
}

func checkHand(_ numb:Int, _ hand:String, _ leftDistance:Int, _ rightDistance:Int) -> String {
    
    if leftDistance == rightDistance {
        return usedHand(numb, hand)
    } else if leftDistance > rightDistance {
        lastRight = numb
        return "R"
    } else if leftDistance < rightDistance {
        lastLeft = numb
        return "L"
    }
    return ""
}


// MARK: - countKeypad를 사용하여 키패드간의 거리를 계산해주는 이중 for문 사용

func countKeypad(_ start: Int , _ dest: Int) -> Int {
    // [ 1, 2,  3]
    // [ 4, 5,  6]
    // [ 7, 8,  9]
    // [-1, 0, -2]
    let keypad = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [-1, 0, -2]]
    var startPos = [0, 0]
    var destPos = [0, 0]

    for i in 0..<4 {
        for j in 0..<3 {
            if keypad[i][j] == start {
                startPos[0] = i
                startPos[1] = j
            }
            if keypad[i][j] == dest {
                destPos[0] = i
                destPos[1] = j
            }
        }
    }

    var count = 0
    for i in 0...1 {
        count += startPos[i] > destPos[i] ? startPos[i] - destPos[i] : destPos[i] - startPos[i]
    }

    return count
}

func solution(_ numbers:[Int], _ hand:String) -> String {
    var LH = -1 //*
    var RH = -2 //#
    var result = ""

    for n in numbers {
        switch n {
        case 1, 4, 7:
            LH = n
            result += "L"
            break

        case 3, 6, 9:
            RH = n
            result += "R"
            break

        default:
            let countLH = countKeypad(LH, n)
            let countRH = countKeypad(RH, n)

            // 같은거리면 왼손잡이 오른손잡이로 누름
            if countLH == countRH {
                if hand == "left" {
                    LH = n
                    result += "L"
                } else {
                    RH = n
                    result += "R"
                }
                break
            }

            // 가까운 손으로 누름
            if countLH < countRH {
                LH = n
                result += "L"
            } else {
                RH = n
                result += "R"
            }
            break
        }
    }

    return result
}


// MARK: - enum 값 사용 및 거리계산식 알고있으면 깔끔한 풀이

func solution(_ numbers:[Int], _ hand:String) -> String {
    
  enum KeypadHand {
    case left
    case right
  }

  var result = ""
  var leftHand = 10
  var rightHand = 12

  for i in numbers {
    let number = i == 0 ? 11 : i        // i값이 0일경우 11로 예외처리
    var tapHand: KeypadHand = .left     // 어느손으로 누를건지 enum 생성 디폴트값 enum.left

    switch number {
    case 1, 4, 7:
      tapHand = .left

    case 3, 6, 9:
      tapHand = .right

    case 2, 5, 8, 11:
      let leftTemp = (number - leftHand).magnitude      // 절대값
      let rightTemp = (number - rightHand).magnitude

      let leftDistance = (leftTemp / 3) + (leftTemp % 3)        // 거리 계산식
      let rightDistance = (rightTemp / 3) + (rightTemp % 3)

      if leftDistance == rightDistance {            // 거리가 같으면 ? 주손으로 enum값 지정
        tapHand = hand == "left" ? .left : .right
      } else {
        tapHand = leftDistance < rightDistance ? .left : .right
      }

    default:
      break
    }

    if tapHand == .left {
      result.append("L")
      leftHand = number
    } else {
      result.append("R")
      rightHand = number
    }
  }

  return result
}
var Numbers = [1, 3, 4, 5, 8, 2, 1, 4, 5, 9, 5]
var Hand = "right"

print("13458214595")
print(solution(Numbers, Hand))
print("LRLLLRLLRRL")
