import Foundation

public class ElfCPUFixer {
    private let processor: ElfProcessor
    
    public init(processor: ElfProcessor) {
        self.processor = processor
    }
    
    public func p1FindSignalSums(_ input:[String]) -> Int {
        var result = 0
        let callback:ElfProcessor.EPCallback = {clock, register in
            result += (clock * register)
        }
        self.processor.subscribe(forClock: 20, callback)
        self.processor.subscribe(forClock: 60, callback)
        self.processor.subscribe(forClock: 100, callback)
        self.processor.subscribe(forClock: 140, callback)
        self.processor.subscribe(forClock: 180, callback)
        self.processor.subscribe(forClock: 220, callback)
        
        for line in input {
            if line == "noop" {
                let _ = self.processor.noop()
            } else if line.hasPrefix("addx") {
                let toAdd = Int(line.split(separator:" ").last!)!
                let _ = self.processor.addX(toAdd)
            }
        }
        
        return result
    }
    
    public func p2DrawCharacters(_ input:[String]) -> String {
        self.processor.reset()
        var result = ""
        for line in input {
            if line == "noop" {
                result += self.processor.noop()
            } else if line.hasPrefix("addx") {
                let toAdd = Int(line.split(separator:" ").last!)!
                result += self.processor.addX(toAdd)
            }
            print(result)
        }
        return result
    }
}
