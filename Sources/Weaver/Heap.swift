import Foundation

public class Heap<T: Comparable> {
    public enum Orientation {
        case min, max
    }
    
    private enum Child {
        case left, right
    }
    
    public let orientation: Orientation
    public let size: Int?
    
    private var values: [T]
    
    public init(values: [T], orientation: Orientation = .min, size: Int? = nil) {
        // The first useful value should be at index 1.
        var offest: [T] = []
        if let first = values.first {
            offest = [first]
        }
        
        self.values = offest + values
        self.orientation = orientation
        self.size = size
        print("~~~ before heapify)")
        heapify()
        print("~~~ after heapfiy")
    }
    
    public func getValues() -> [T] {
        return Array(values[1..<values.count])
    }
    
    public func insert(_ value: T) {
        // The first useful value should be at index 1.
        if values.isEmpty {
            values.append(value)
        }
        
        values.append(value)
        
        var index = values.count - 1
        while index > 0 {
            if balanceWithChildren(parentIndex(of: index)) != nil {
                index = parentIndex(of: index)
            } else {
                break
            }
        }
        
        if let size = size {
            while values.count < size {
                values.removeLast()
            }
        }
    }
    
    public func peek() -> T? {
        guard values.count > 1 else { return nil }
        return values[1]
    }
    
    public func remove() -> T? {
        guard let value = peek() else { return nil }
        
        if let last = values.popLast(),
            values.count > 1 {
            values[1] = last
        }
        
        var index = 1
        while index <= values.count / 2 {
            if let swappedChild = balanceWithChildren(index) {
                guard let childIndex = childIndex(of: index, child: swappedChild) else { break }
                index = childIndex
            } else {
                break
            }
        }
        
        return value
    }
    
    private func heapify() {
        var i = values.count / 2
        
        while i > 0 {
            heapify(at: i)
            i -= 1
        }
    }
    
    private func heapify(at index: Int) {
        if let child = balanceWithChildren(index),
           let childIndex = childIndex(of: index, child: child) {
            heapify(at: childIndex)
        }
    }
    
    @discardableResult
    private func balanceWithChildren(_ index: Int) -> Child? {
        
        print("~~~ balancing index: \(index)")
        guard index > 0 else { return nil }
        var significant = values[index]
        var child: Child?
        
        if let leftValue = childValue(of: index, child: .left),
           compare(leftValue, significant) {
            significant = leftValue
            child = .left
        }
        
        if let rightValue = childValue(of: index, child: .right),
           compare(rightValue, significant) {
            significant = rightValue
            child = .right
        }
        
        if let child = child {
            swapChild(of: index, child: child)
            return child
        }
        
        return nil
    }
    
    // For min heap, will return true if left is less than right,
    // for max heap, will return true if left is greater than right.
    private func compare(_ left: T, _ right: T) -> Bool {
        switch orientation {
        case .min:
            return left < right
        case .max:
            return left > right
        }
    }
    
    private func parentIndex(of index: Int) -> Int {
        return index / 2
    }
    
    private func childIndex(of parentIndex: Int, child: Child) -> Int? {
        var result: Int
        switch child {
        case .right:
            result = parentIndex * 2 + 1
        case .left:
            result = parentIndex * 2
        }
        return result < values.count ? result : nil
    }
    
    private func swapParent(of index: Int) {
        let parentIndex = index / 2
        let parentValue = values[parentIndex]
        values[parentIndex] = values[index]
        values[index] = parentValue
    }
    
    private func swapChild(of parentIndex: Int, child: Child) {
        guard let childIndex = childIndex(of: parentIndex, child: child) else { return }
        let parentValue = values[parentIndex]
        values[parentIndex] = values[childIndex]
        values[childIndex] = parentValue
    }
    
    private func childValue(of parentIndex: Int, child: Child) -> T? {
        guard let index = childIndex(of: parentIndex, child: child) else { return nil }
        return values[index]
    }
}
