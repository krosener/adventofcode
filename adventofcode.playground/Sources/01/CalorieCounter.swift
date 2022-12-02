import Foundation

public class CalorieCounter {
    public static func findMostCalorieCount(_ input:String) -> Int {
        // Simplest method, just keep track of current maximum and replace if new is higher
        var cur_max = 0
        var current = 0
        for line in input.split(separator: "\n", omittingEmptySubsequences: false) {
            let snack = Int(line) ?? 0
            if snack == 0 {
                current = 0
            }
            current += snack
            if cur_max < current {
                cur_max = current
            }
        }
        return cur_max
    }
    
    public static func topThreeHeapifyCalorieCounts(_ input:String) -> Int {
        // slightly more complex, use a max-heap and pop three elements at the end
        let calHeap = Heap<Int>()
        var current = 0
        for line in input.split(separator: "\n", omittingEmptySubsequences: false) {
            let snack = Int(line) ?? 0
            if snack == 0 {
                calHeap.push(current)
                current = 0
            }
            current += snack
        }
        var result = -1
        if let first = calHeap.pop() {
            if let second = calHeap.pop() {
                if let third = calHeap.pop() {
                    result = first + second + third
                }
            }
        }
        return result
    }
}

