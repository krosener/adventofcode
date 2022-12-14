import Foundation

public extension Dictionary {
    static func characterDictionary() -> [Character:Int] {
        var result = [Character:Int]()
        for char in "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"{
            result[char] = 0
        }
        return result
    }
}
