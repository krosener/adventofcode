import Foundation

public class ElfDeleteFolder {
    var root:ElfFolder
    public required init(_ input: [String]) {
        root = ElfFolder("/")
        parseInput(input)
    }
    
    
    public func p1FindSumOfSmallFolders() -> Int {
        let upTo = 100000
        var result = 0
        
        func countDirectory(_ dir:ElfFolder) -> Int {
            var dirSize = 0
            for subDir in dir.dirs {
                dirSize += countDirectory(subDir)
            }
            for file in dir.files {
                dirSize += file.size
            }
            if dirSize <= upTo {
                result += dirSize
            }
            return dirSize
        }
        
        let _ = countDirectory(root)
        
        return result
    }
    
    public func p2FindSmallestDirToDelete() -> Int{
        let totalSize = 70000000
        let update = 30000000
        var result = 0
        
        let heap = Heap<Int>()
        
        func countDirectory(_ dir:ElfFolder) -> Int {
            var dirSize = 0
            for subDir in dir.dirs {
                dirSize += countDirectory(subDir)
            }
            for file in dir.files {
                dirSize += file.size
            }
            heap.push(dirSize)
            return dirSize
        }
        
        _ = countDirectory(root)
        let free = totalSize - (heap.pop())!
        let needToFree = update - free
        while heap.peek()! > needToFree {
            result = heap.pop()!
        }
        
        return result
    }
    
    private func parseInput(_ input: [String]) {
        var currentFolder = [ElfFolder]()
        for line in input {
            if line.hasPrefix("$") {
                if line.hasPrefix("$ cd") {
                    if line.hasSuffix("..") { // "$ cd .." go back to parent folder
                        currentFolder.removeLast()
                    } else if line.hasSuffix("/") { // "for first cd into root
                        currentFolder.append(root)
                    } else {
                        let folder = ElfFolder(String(line.suffix(from: line.index(after:line.lastIndex(of:" ")!))))
                        currentFolder.last!.dirs.append(folder)
                        currentFolder.append(folder)
                    }
                } // ignore ls, since input is only cd and ls, we can skip ls and just add any results from ls that are present
            } else {
                // now in ls
                if !line.hasPrefix("dir") {  // ignore dir because we are creating them in cd
                    let splitLine = line.split(separator: " ")
                    let size = Int(splitLine[0])!
                    let fileName = String(splitLine[1])
                    currentFolder.last!.files.append(ElfFile(name: fileName, size: size))
                }
            }
        }
    }
}
