import Foundation

public class Queue<T>: ExpressibleByArrayLiteral {
    class Node<T> {
        let value: T
        var next: Node?
        
        init(value: T, next: Node? = nil) {
            self.value = value
            self.next = next
        }
    }
    
    private var head: Node<T>?
    
    private var tail: Node<T>?
    
    public private (set) var count = 0
    
    public var isEmpty: Bool {
        count == 0
    }
    
    public init(_ values: [T] = []) {
        for value in values {
            enqueue(value)
        }
    }
    
    required public convenience init(arrayLiteral elements: T...) {
        self.init(elements)
    }
    
    public func enqueue(_ item: T) {
        let newNode = Node(value: item)
        
        count += 1

        tail?.next = newNode
        tail = newNode
        
        if head == nil {
            head = tail
        }
    }
    
    public func dequeue() -> T? {
        let result = head
        head = head?.next
        
        if result != nil {
            count -= 1
        }
        
        return result?.value
    }
}
