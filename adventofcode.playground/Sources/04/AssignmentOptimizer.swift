import Foundation

public class AssignmentOptimizer {
    
    public static func p1GetOverlap(_ input:[String]) -> Int {
        var result = 0
        for line in input {
            let (r1, r2) = convertLine(line)
            if (r1.lowerBound <= r2.lowerBound && r1.upperBound >= r2.upperBound) ||
                (r2.lowerBound <= r1.lowerBound && r2.upperBound >= r1.upperBound) {
                result += 1
            }
        }
        
        return result
    }
    
    public static func p2GetAnyOverlap(_ input:[String]) -> Int {
        var result = 0
        for line in input {
            let (r1, r2) = convertLine(line)
            if r1.overlaps(r2) {
                result += 1
            }
        }
        
        return result
    }
    
    public static func convertLine(_ line:String) -> (ClosedRange<Int>, ClosedRange<Int>) {
        let commaIndex = line.firstIndex(of: ",")!
        let rangeStr1 = line[line.startIndex..<commaIndex]
        let rangeStr2 = line[commaIndex...].dropFirst()
        let firstDashIndex = rangeStr1.firstIndex(of: "-")!
        let secondDashIndex = rangeStr2.firstIndex(of: "-")!
        let rInt1 = Int(rangeStr1[rangeStr1.startIndex..<firstDashIndex]) ?? -1
        let rInt2 = Int(rangeStr1[firstDashIndex...].dropFirst()) ?? -1
        let rInt3 = Int(rangeStr2[rangeStr2.startIndex..<secondDashIndex]) ?? -1
        let rInt4 = Int(rangeStr2[secondDashIndex...].dropFirst()) ?? -1
        return (rInt1...rInt2, rInt3...rInt4)
    }
}
