import Foundation

//TreeHeight VisibleCalculator

public typealias treeCoord = (Int, Int)

public class THVisibleCalculator {
    private(set) var treeGrid: [[THTree]]
    
    public init(_ input:[String]) {
        treeGrid = [[THTree]]()
        for line in input {
            var treeLine = [THTree]()
            for char in line {
                treeLine.append(THTree(height:char.wholeNumberValue ?? -1))
            }
            treeGrid.append(treeLine)
        }
    }
    
    public func p1CountVisibleTrees() -> Int {
        let height = treeGrid.count
        let width = treeGrid[0].count
        for i in 0..<height {
            populateVisible(lhs: (0, i), rhs: (width - 1, i))
        }
        for i in 0..<width {
            populateVisible(lhs: (i, 0), rhs: (i, height - 1))
        }
        var visibleCount = 0
        for treeLine in treeGrid {
            for tree in treeLine {
                if tree.isVisible {
                    visibleCount += 1
                }
            }
        }
        return visibleCount
    }
    
    public func p2CountScenicScores() -> Int{
        var result = 0
        for y in 1..<treeGrid.count - 1 {
            // skip first and last rows because they will always be 0
            for x in 1..<treeGrid[0].count - 1 { // same for columns
                result = max(result, countVisible((x, y)))
            }
        }
        return result
    }
    
    private func countVisible(_ from:treeCoord) -> Int {
        let fromHeight = treeGrid[from.1][from.0].height
        let yMax = treeGrid.count
        let xMax = treeGrid[from.1].count
        var curX = from.0
        var curY = from.1
        var score = 1
        for dir in [(0, 1), (0, -1), (1, 0), (-1, 0)] {
            var curHeight = -1
            var visible = 0
            while curHeight < fromHeight {
                curX += dir.0
                curY += dir.1
                if curX < 0 || curX >= xMax
                    || curY < 0 || curY >= yMax {
                    break
                }
                visible += 1
                curHeight = treeGrid[curY][curX].height
            }
            score *= visible
            curX = from.0
            curY = from.1
        }
        return score
    }
    
    private func populateVisible(lhs:treeCoord, rhs:treeCoord) {
        // imagine [0, 1, 2, 3, 5, 3, 2, 1] all trees visible
        // start from left moving right, keep track of current max height
        // [0check, 1check, 2check, 3check, 5check, 3, 2, 1] reached end with max 5
        // then start from right side, stop when reaching previous max
        // [0, 1, 2, 3, 5stop!, 3check, 2check, 1check]
        // O(2n) per line.
        
        // first detect iteration, (0, 0) -> (0, 100) means we increment by (0, 1)
        // guard against iter on both, one pair must have equal .0 or .1
        if rhs.0 != lhs.0 && rhs.1 != lhs.1 {return}
        let iterRight:treeCoord = rhs.0 != lhs.0 ? (1, 0) : (0, 1)
        var curPos = lhs
        var curMaxHeight = -1
        while curPos.0 <= rhs.0 && curPos.1 <= rhs.1 {
            if treeGrid[curPos.0][curPos.1].height > curMaxHeight {
                treeGrid[curPos.0][curPos.1].isVisible = true
                curMaxHeight = treeGrid[curPos.0][curPos.1].height
            }
            curPos.0 += iterRight.0
            curPos.1 += iterRight.1
        }
        let absMaxHeight = curMaxHeight
        curMaxHeight = -1
        curPos = rhs
        while curPos.0 >= lhs.0 && curPos.1 >= lhs.1 {
            if treeGrid[curPos.0][curPos.1].height > curMaxHeight {
                treeGrid[curPos.0][curPos.1].isVisible = true
                curMaxHeight = treeGrid[curPos.0][curPos.1].height
            }
            if curMaxHeight == absMaxHeight {
                break
            }
            curPos.0 -= iterRight.0
            curPos.1 -= iterRight.1
        }
    }
}
