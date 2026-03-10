import Foundation
import Testing
@testable import Weaver

@Suite("Heap Tests")
struct HeapTests {
    @Test func initEmpty() {
        let values: [Int] = []
        
        var heap = Heap(values, orientation: .min)
        
        heap.insert(4)
        
        #expect(heap.values == [4])
    }
    
    @Test func insertSmallest() {
        let values = [2,3,4,8]
        
        var heap = Heap(values, orientation: .min)
        
        heap.insert(1)
        
        #expect(heap.peek() == 1)
    }
    
    @Test func insertOther() {
        let values = [2,3,4,8]
        
        var heap = Heap(values, orientation: .min)
        
        heap.insert(5)
        
        #expect(heap.peek() == 2)
    }
    
    @Test func removeRepeatedly() {
        let values = [3,2,1,5,6,4]

        var heap = Heap(values, orientation: .max)

        #expect(heap.pop() == 6)
        #expect(heap.pop() == 5)
        #expect(heap.pop() == 4)
        #expect(heap.pop() == 3)
        #expect(heap.pop() == 2)
        #expect(heap.pop() == 1)
        
        var otherHeap = Heap([3,1,2,4], orientation: .max)
        
        #expect(otherHeap.pop() == 4)
        #expect(otherHeap.pop() == 3)
        #expect(otherHeap.pop() == 2)
        #expect(otherHeap.pop() == 1)
    }
    
    @Test func remove() {
        let values = [3,2,1,7,8,4,19,16,12]
        
        var heap = Heap(values, orientation: .min)
        
        #expect(heap.pop() == 1)
        #expect(heap.peek() == 2)
        
        #expect(heap.pop() == 2)
        #expect(heap.peek() == 3)
        
        #expect(heap.pop() == 3)
        #expect(heap.peek() == 4)
        
        #expect(heap.pop() == 4)
        #expect(heap.peek() == 7)
        
        #expect(heap.pop() == 7)
        #expect(heap.pop() == 8)
        #expect(heap.pop() == 12)
        #expect(heap.pop() == 16)
        #expect(heap.pop() == 19)
    }
    
    @Test func removeSingle() {
        let values = [1]
        
        var heap = Heap(values, orientation: .min)
        
        #expect(heap.pop() == 1)
    }
}
