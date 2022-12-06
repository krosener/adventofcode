import Foundation

public class SignalFinder {
    
    public static func p1GetStartOfPacket(_ input:String) -> Int {
        var windowLeft = 0
        var windowRight = 0
        var characters = [Character:Int].characterDictionary()
        let inputChars = Array(input)
        while windowRight < input.count {
            let curChar = inputChars[windowRight]
            characters[curChar]! += 1
            if characters[curChar]! > 1 {
                while windowLeft < windowRight {
                    let removeChar = inputChars[windowLeft]
                    characters[removeChar]! -= 1
                    windowLeft += 1
                    if removeChar == curChar {
                        break
                    }
                }
            }
            windowRight += 1
            if windowRight - windowLeft == 4 {
                return windowRight
            }
        }
        return -1 // no packet detected
    }
    
    public static func p2GetStartOfMessage(_ input:String) -> Int {
        var windowLeft = 0
        var windowRight = 0
        var characters = [Character:Int].characterDictionary()
        let inputChars = Array(input)
        while windowRight < input.count {
            let curChar = inputChars[windowRight]
            characters[curChar]! += 1
            if characters[curChar]! > 1 {
                while windowLeft < windowRight {
                    let removeChar = inputChars[windowLeft]
                    characters[removeChar]! -= 1
                    windowLeft += 1
                    if removeChar == curChar {
                        break
                    }
                }
            }
            windowRight += 1
            if windowRight - windowLeft == 14 {
                return windowRight
            }
        }
        return -1 // no message detected
    }
}
