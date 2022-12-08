import Foundation

public class ElfFolder {
    let name: String
    
    public init(_ name:String) {
        self.name = name
    }
    var dirs = [ElfFolder]()
    var files = [ElfFile]()
}
