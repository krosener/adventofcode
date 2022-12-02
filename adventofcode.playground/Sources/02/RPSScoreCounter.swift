import Foundation

public class RPSScoreCounter {
    
    enum option: Int {
        case rock     = 1
        case paper    = 2
        case scissors = 3
    }
    
    enum outcome: Int {
        case lose = 0
        case draw = 3
        case win  = 6
    }
    
    public static func countP1Score(_ input:String) -> Int {
        var result = 0
        for line in input.split(separator: "\n") {
            var enemy:option = .rock
            var shoot:option = .rock
            switch line.first {
            case "A":
                enemy = .rock
            case "B":
                enemy = .paper
            case "C":
                enemy = .scissors
            default:
                print("parse error")
            }
            switch line.last {
            case "X":
                shoot = .rock
            case "Y":
                shoot = .paper
            case "Z":
                shoot = .scissors
            default:
                print("parse error")
            }
            result += shoot.rawValue
            result += rps(enemy, shoot).rawValue
            
        }
        return result
    }
    
    public static func countP2Score(_ input:String) -> Int {
        var result = 0
        for line in input.split(separator: "\n") {
            var enemy:option = .rock
            var outcome:outcome = .lose
            switch line.first {
            case "A":
                enemy = .rock
            case "B":
                enemy = .paper
            case "C":
                enemy = .scissors
            default:
                print("parse error")
            }
            switch line.last {
            case "X":
                outcome = .lose
            case "Y":
                outcome = .draw
            case "Z":
                outcome = .win
            default:
                print("parse error")
            }
            result += outcome.rawValue
            result += shootForOutcome(enemy, outcome).rawValue
        }
        return result
    }
    
    
    private static func rps(_ enemy:option, _ shoot:option) -> outcome {
        if enemy == shoot {
            return .draw
        }
        if enemy == .scissors && shoot == .rock {
            return .win
        }
        if enemy == .rock && shoot == .paper {
            return .win
        }
        if enemy == .paper && shoot == .scissors {
            return .win
        }
        return .lose
    }
    
    private static func shootForOutcome(_ enemy:option, _ outcome:outcome) -> option {
        if outcome == .draw {
            return enemy
        }
        if enemy == .scissors {
            if outcome == .win {
                return .rock
            }
            return .paper
        }
        if enemy == .rock {
            if outcome == .win {
                return .paper
            }
            return .scissors
        }
        if enemy == .paper {
            if outcome == .win {
                return .scissors
            }
            return .rock
        }
        print("should never reach here")
        return enemy
    }
}
