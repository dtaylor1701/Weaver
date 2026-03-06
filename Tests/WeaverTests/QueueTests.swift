import Testing
import Weaver

@Suite("Queue Tests")
struct QueueTests {

    @Test func count() {
        let queue = Queue<Int>()
        
        #expect(queue.count == 0)
        
        queue.enqueue(2)
        
        #expect(queue.count == 1)
        
        _ = queue.dequeue()
        
        #expect(queue.count == 0)
    }
    
    @Test func dequeue() {
        let queue = Queue<Int>()
        
        #expect(queue.dequeue() == nil)
        
        queue.enqueue(4)
        queue.enqueue(2)
        
        #expect(queue.dequeue() == 4)
        #expect(queue.dequeue() == 2)
    }
    
    @Test func isEmpty() {
        let queue = Queue<Int>()
        
        #expect(queue.isEmpty)
        
        queue.enqueue(4)
        
        #expect(!queue.isEmpty)
    }

}
