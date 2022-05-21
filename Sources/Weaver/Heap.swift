import Foundation

public struct Heap<T: Comparable> {
    public enum Orientation {
        case min, max
    }
    
    private enum Side {
        case left, right
    }
    
    public let orientation: Orientation
    
    public private(set) var values: [T]
    
    public var count: Int {
        values.count
    }
    
    public var isEmpty: Bool {
        count == 0
    }
    
    public init(_ values: [T], orientation: Orientation = .min) {
        self.values = values
        self.orientation = orientation
        
        heapify()
    }
    
    public mutating func insert(_ value: T) {
        values.append(value)
        
        var index = values.count - 1
        while index > 0 {
            guard let parentIndex = parentIndex(of: index) else { break }
            if compare(values[index], values[parentIndex]) {
                let toSwap = values[index]
                values[index] = values[parentIndex]
                values[parentIndex] = toSwap
                index = parentIndex
            } else {
                break
            }
        }
    }
    
    public func peek() -> T? {
        return values.first
    }
    
    public mutating func pop() -> T? {
        guard let value = peek(), let last = values.last else { return nil }
        
        values[0] = last
        values.removeLast()
        
        bubbleDown(index: 0)
        
        return value
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
    
    private mutating func heapify() {
        guard var index = parentIndex(of: values.count - 1) else { return }
        
        while index >= 0 {
            bubbleDown(index: index)
            
            index -= 1
        }
    }
    
    private mutating func bubbleDown(index: Int) {
        var index = index
        
        while index < values.count {
            var significant = values[index]
            var significantSide: Side?
            
            if let leftChildValue = childValue(of: index, on: .left),
               compare(leftChildValue, significant) {
                significant = leftChildValue
                significantSide = .left
            }
            
            if let rightChildValue = childValue(of: index, on: .right),
               compare(rightChildValue, significant) {
                significant = rightChildValue
                significantSide = .right
            }
            
            if let side = significantSide {
                swapValue(at: index, withChild: side)
                guard let childIndex = childIndex(of: index, on: side) else { break }
                index = childIndex
            } else {
                break
            }
        }
    }
    
    private func childIndex(of index: Int, on side: Side) -> Int? {
        var childIndex = index * 2
        childIndex = side == .left ? childIndex + 1 : childIndex + 2
        
        guard childIndex < values.count else { return nil }
        
        return childIndex
    }
    
    private func parentIndex(of index: Int) -> Int? {
        guard index > 0 && index < values.count else { return nil }
        guard index > 2 else { return 0 }
        
        return (index - 1) / 2
    }
    
    private func childValue(of index: Int, on side: Side) -> T? {
        guard let childIndex = childIndex(of: index, on: side) else { return nil }
        
        return values[childIndex]
    }
    
    private mutating func swapValue(at index: Int, withChild side: Side) {
        guard let childIndex = childIndex(of: index, on: side) else { return }
        
        let value = values[index]
        values[index] = values[childIndex]
        values[childIndex] = value
    }
}
