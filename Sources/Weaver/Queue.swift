import Foundation

public class Queue<T> {
    
    class Node<T> {
        let value: T
        var next: Node?
        
        init(value: T, next: Node? = nil) {
            self.value = value
            self.next = next
        }
    }
    
    private var head: Node<T>?
    
    public private (set) var count = 0
    
    public init() { }
    
    public func enqueue(_ item: T) {
        let newNode = Node(value: item)
        
        count += 1
        
        newNode.next = head
        head = newNode
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
