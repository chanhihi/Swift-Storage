import Foundation

func solution(_ new_id:String) -> String {
    let ex = ["-","_","."]
    var id = new_id.lowercased().filter {$0.isNumber || $0.isLetter || ex.contains(String($0))}.map {String($0)}.joined() // 1, 2
    
    while id.contains(".."){
        id = id.replacingOccurrences(of: "..", with: ".")
    } // 3 loop
    
    id = id.trimmingCharacters(in : ["."]) // 4
    
    if id.isEmpty{
        id = "a"
    } // 5
    
    if id.count > 15 {
        id = String(id.prefix(15))
        id = id.trimmingCharacters(in : ["."])
    } // 6
    
    while id.count < 3 {
        guard let last = id.last else {return ""}
        id += String(last)
    }
    
    return id
}