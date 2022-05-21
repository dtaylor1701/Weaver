import Foundation
import XCTest
@testable import Weaver

class HeapTests: XCTestCase {

    func testInitEmpty() {
        let values: [Int] = []
        
        var heap = Heap(values, orientation: .min)
        
        heap.insert(4)
        
        XCTAssertEqual(heap.values, [4])
    }
    
    func testInsertSmallest() {
        let values = [2,3,4,8]
        
        var heap = Heap(values, orientation: .min)
        
        heap.insert(1)
        
        XCTAssertEqual(heap.peek(), 1)
    }
    
    func testInsertOther() {
        let values = [2,3,4,8]
        
        var heap = Heap(values, orientation: .min)
        
        heap.insert(5)
        
        XCTAssertEqual(heap.peek(), 2)
    }
    
    func testRemoveRepeatedly() {
        let values = [3,2,1,5,6,4]

        var heap = Heap(values, orientation: .max)

        XCTAssertEqual(heap.pop(), 6)
        XCTAssertEqual(heap.pop(), 5)
        XCTAssertEqual(heap.pop(), 4)
        XCTAssertEqual(heap.pop(), 3)
        XCTAssertEqual(heap.pop(), 2)
        XCTAssertEqual(heap.pop(), 1)
        
        var otherHeap = Heap([3,1,2,4], orientation: .max)
        
        XCTAssertEqual(otherHeap.pop(), 4)
        XCTAssertEqual(otherHeap.pop(), 3)
        XCTAssertEqual(otherHeap.pop(), 2)
        XCTAssertEqual(otherHeap.pop(), 1)
    }
    
    func testRemove() {
        let values = [3,2,1,7,8,4,19,16,12]
        
        var heap = Heap(values, orientation: .min)
        
        XCTAssertEqual(heap.pop(), 1)
        XCTAssertEqual(heap.peek(), 2)
        
        XCTAssertEqual(heap.pop(), 2)
        XCTAssertEqual(heap.peek(), 3)
        
        XCTAssertEqual(heap.pop(), 3)
        XCTAssertEqual(heap.peek(), 4)
        
        XCTAssertEqual(heap.pop(), 4)
        XCTAssertEqual(heap.peek(), 7)
        
        XCTAssertEqual(heap.pop(), 7)
        XCTAssertEqual(heap.pop(), 8)
        XCTAssertEqual(heap.pop(), 12)
        XCTAssertEqual(heap.pop(), 16)
        XCTAssertEqual(heap.pop(), 19)
    }
    
    func testRemoveSingle() {
        let values = [1]
        
        var heap = Heap(values, orientation: .min)
        
        XCTAssertEqual(heap.pop(), 1)
    }
}
