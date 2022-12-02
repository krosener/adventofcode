import Foundation

// MARK: public interface
public protocol HeapInterface {
    associatedtype Item : Comparable
    mutating func push(_ item : Item)
    func peek() -> Item?
    mutating func pop() -> Item?
}


// MARK: default implementation
public class Heap<T:Comparable> : HeapInterface {
    let cmp : (T, T) -> Bool
    
    init(_ isMaxHeap: Bool = true) {
        if isMaxHeap {
            cmp = {$0 < $1}
        } else {
            cmp = {$0 > $1}
        }
    }
    
    public func push(_ item: T) {
        data.append(item)
        heapifyUp()
    }
    
    public func peek() -> T? {
        
        return data.first
    }
    
    public func pop() -> T? {
        let result = peek()
        if result != nil {
            data[0] = data.last! // must be present becuase list is not empty
            data.removeLast()
            heapifyDown()
        }
        return result
    }
    
    private func heapifyDown() {
        var i = 0
        let count = data.count // because for some reason, swift does a full traversal for each call to count instead of storing an int
        while i < count {
            if right(i) < count && cmp(data[i], data[right(i)]) && cmp(data[left(i)], data[right(i)]) {
                let swap = data[right(i)]
                data[right(i)] = data[i]
                data[i] = swap
                i = right(i)
            } else if left(i) < count && cmp(data[i], data[left(i)]) && cmp(data[right(i)], data[left(i)]) {
                let swap = data[left(i)]
                data[left(i)] = data[i]
                data[i] = swap
                i = left(i)
            } else {
                break
            }
        }
    }
    
    private func heapifyUp() {
        var i = data.count - 1
        while i > 0 {
            if cmp(data[parent(i)], data[i]) {
                let swap = data[parent(i)]
                data[parent(i)] = data[i]
                data[i] = swap
                i = parent(i)
            } else {
                break
            }
        }
    }
    
    private(set) var data = [T]()
    
    private func parent(_ node: Int) -> Int {(node - 1) / 2}
    private func left(_ node: Int) -> Int {(node * 2) + 1}
    private func right(_ node: Int) -> Int {left(node) + 1}
}
