import Foundation

/*
 since it always starts like this, just create it manually
        [H]     [W] [B]
    [D] [B]     [L] [G] [N]
[P] [J] [T]     [M] [R] [D]
[V] [F] [V]     [F] [Z] [B]     [C]
[Z] [V] [S]     [G] [H] [C] [Q] [R]
[W] [W] [L] [J] [B] [V] [P] [B] [Z]
[D] [S] [M] [S] [Z] [W] [J] [T] [G]
[T] [L] [Z] [R] [C] [Q] [V] [P] [H]
 1   2   3   4   5   6   7   8   9

 */

public class CrateMover {
    
    public static func p1MoveCrates(_ input:[String]) -> String {
        var cratesLists = setUpCrates()
        for line in input {
            if !line.isEmpty {
                let (count, from, to) = parseCommand(line)
                for _ in 0..<count {
                    cratesLists[to].append(cratesLists[from].removeLast())
                }
            }
        }
        return cratesLists.map { $0.last ?? ""}.reduce(""){$0 + $1}
    }
    
    public static func p2MoveCrates(_ input:[String]) -> String {
        var cratesLists = setUpCrates()
        for line in input {
            if !line.isEmpty {
                let (count, from, to) = parseCommand(line)
                cratesLists[to] = cratesLists[to] + cratesLists[from].suffix(count)
                cratesLists[from].removeLast(count)
            }
        }
        
        return cratesLists.map { $0.last ?? ""}.reduce(""){$0 + $1}
    }
    
    private static func parseCommand(_ command:String) -> (Int, Int, Int) {
        // ex: move 3 from 2 to 9
        let split = command.split(separator:" ")
        return (Int(split[1])!, Int(split[3])! - 1, Int(split[5])! - 1)
    }
    
    private static func setUpCrates() -> [[String]] {
        return [
        ["T", "D", "W", "Z", "V", "P"],
        ["L", "S", "W", "V", "F", "J", "D"],
        ["Z", "M", "L", "S", "V", "T", "B", "H"],
        ["R", "S", "J"],
        ["C", "Z", "B", "G", "F", "M", "L", "W"],
        ["Q", "W", "V", "H", "Z", "R", "G", "B"],
        ["V", "J", "P", "C", "B", "D", "N"],
        ["P", "T", "B", "Q"],
        ["H", "G", "Z", "R", "C"]
        ]
    }
}
