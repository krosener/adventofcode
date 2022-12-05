import Foundation

public class RucksackReorganizer {
    
    public static func p1GetPriorities(_ input: String) -> Int {
        var result = 0
        var inSack = [Character:Int]()
        for line in input.split(separator: "\n") {
            let half = line.count / 2
            for i in 0..<half {
                let char = line[line.index(line.startIndex, offsetBy: i)] as Character
                inSack[char] = 1
            }
            var toAdd = 0
            for i in half..<line.count {
                let char = line[line.index(line.startIndex, offsetBy: i)] as Character
                if inSack[char] != nil {
                    toAdd = charToPriority(char)
                }
            }
            inSack.removeAll()
            result += toAdd
        }
        
        return result
    }
    
    public static func p2GetBadges(_ input: String) -> Int {
        var result = 0
        var first = [Character:Bool]()
        var second = [Character:Bool]()
        for line in input.split(separator: "\n") {
            if !second.isEmpty { // third find last common value
                for char in line {
                    if second[char] != nil {
                        result += charToPriority(char)
                        second.removeAll()
                        first.removeAll()
                        break
                    }
                }
            } else if !first.isEmpty { // second compare to first dictionary, store common values
                for char in line {
                    if first[char] != nil {
                        second[char] = true
                    }
                }
            } else {
                // first set up the dictionary
                for char in line {
                    first[char] = true
                }
            }
        }
        
        return result
    }
    
    private static let toPrioConstant = Int(("A" as Character).asciiValue!) - 1
    private static func charToPriority(_ char:Character) -> Int {
        let upper = char.uppercased().first!
        if let charVal = upper.asciiValue {
            var result = Int(charVal) - toPrioConstant
            if char == upper {
                result += 26
            }
            return result
        }
        return -1
    }
}
