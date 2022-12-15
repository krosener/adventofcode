import Foundation

public class ElfProcessor {
    /**
     Int value provided to callback parameter will be current register value
     **/
    public typealias EPCallback = (Int, Int)->Void
    
    private var callbacks = [Int:[EPCallback]]()
    private var register = 1
    private var clock = 1
    
    public init() {
    }
    
    public func addX(_ val:Int) -> String {
        if let listedCallbacks = callbacks[clock] {
            notifyCallbacks(listedCallbacks)
        }
        var result = getDrawnPixel()
        // end cycle 1
        clock += 1
        if let listedCallbacks = callbacks[clock] {
            notifyCallbacks(listedCallbacks)
        }
        result += getDrawnPixel()
        clock += 1
        //print("register + val \(register) + \(val)")
        register += val
        return result
    }
    
    public func noop() -> String {
        let result = getDrawnPixel()
        clock += 1
        return result
    }
    
    public func reset() {
        callbacks.removeAll()
        register = 1
        clock = 1
    }
    
    public func subscribe(forClock:Int, _ callback: @escaping EPCallback) {
        if callbacks[forClock] == nil {
            callbacks[forClock] = [callback]
        } else {
            callbacks[forClock]!.append(callback)
        }
    }
    
    private func notifyCallbacks(_ callbacks:[EPCallback]) {
        for callback in callbacks {
            callback(clock, register)
        }
    }
    
    private func getDrawnPixel() -> String {
        let crtX = (clock - 1) % 40
        var result = ""
        if crtX == 0 {
            result += "\n"
        }
        if crtX >= (register - 1) && crtX <= register + 1 {
            result += "#"
        } else {
            result += "."
        }
        //print(crtX, register, result)
        return result
    }
}
