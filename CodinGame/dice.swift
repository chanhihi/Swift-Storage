import Foundation

func calculateDiceConditions() {
    guard let n = Int(readLine() ?? "") else { return }

    for _ in 0..<n {
        let dice = readLine() ?? ""
        let diceArray = dice.split(separator: "+")
        
        var totalMin = 0
        var totalMax = 0
        var totalAvg = 0.0
        var totalDice = 0
        var isError = false

        for d in diceArray {
            let diceData = d.split(separator: "d").map { Int($0) ?? 0 }
            
            if diceData.count != 2 || diceData[0] < 1 || diceData[1] < 4 || diceData[1] % 2 != 0 {
                isError = true
                break
            }
            
            let diceNum = diceData[0]
            let diceFace = diceData[1]

            totalMin += diceNum
            totalMax += diceNum * diceFace
            totalAvg += Double(diceNum * (diceFace + 1)) / 2.0
            totalDice += diceData[0]
        }

        if isError {
            print("Error")
            continue
        }

        if totalDice > 10 {
            print("TOO MANY DICE")
            continue
        }
        
        print("Range \(totalMin)-\(totalMax),average \(Int(totalAvg))")
    }
}

calculateDiceConditions()
