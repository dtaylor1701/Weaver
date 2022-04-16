import Foundation
import XCTest
@testable import Weaver

class HeapTests: XCTestCase {
    func testMaxHeapify() {
        let values = [2,1,3,4,0]
        
        let heap = Heap(values: values, orientation: .max)
        
        XCTAssertEqual(heap.getValues(), [4,2,3,1,0])
    }
//    
//    func testMinHeapify() {
//        let values = [3,2,1,7,8,4,19,16,12]
//
//        let heap = Heap(values: values, orientation: .min)
//        print("~~~ heap init")
//        XCTAssertEqual(heap.getValues(), [1,3,2,7,8,4,10,16,12])
//    }

    func testInsertSmallest() {
        let values = [2,3,4,8]
        
        let heap = Heap(values: values, orientation: .min)
        
        heap.insert(1)
        
        XCTAssertEqual(heap.peek(), 1)
    }
    
    func testInsertOther() {
        let values = [2,3,4,8]
        
        let heap = Heap(values: values, orientation: .min)
        
        heap.insert(5)
        
        XCTAssertEqual(heap.peek(), 2)
    }
    
    func testRemoveRepeatedly() {
        let values = [3,2,1,5,6,4]

        let heap = Heap(values: values, orientation: .max)

        XCTAssertEqual(heap.remove(), 6)
        XCTAssertEqual(heap.remove(), 5)
        XCTAssertEqual(heap.remove(), 4)
        XCTAssertEqual(heap.remove(), 3)
        XCTAssertEqual(heap.remove(), 2)
        XCTAssertEqual(heap.remove(), 1)
        
        let otherHeap = Heap(values: [3,1,2,4], orientation: .max)
        
        XCTAssertEqual(otherHeap.remove(), 4)
        XCTAssertEqual(otherHeap.remove(), 3)
        XCTAssertEqual(otherHeap.remove(), 2)
        XCTAssertEqual(otherHeap.remove(), 1)
    }
    
    func testRemove() {
        let values = [3,2,1,7,8,4,19,16,12]
        
        let heap = Heap(values: values, orientation: .min)
        
        XCTAssertEqual(heap.remove(), 1)
        XCTAssertEqual(heap.peek(), 2)
        
        XCTAssertEqual(heap.remove(), 2)
        XCTAssertEqual(heap.peek(), 3)
        
        XCTAssertEqual(heap.remove(), 3)
        XCTAssertEqual(heap.peek(), 4)
        
        XCTAssertEqual(heap.remove(), 4)
        XCTAssertEqual(heap.peek(), 7)
        
        XCTAssertEqual(heap.remove(), 7)
        XCTAssertEqual(heap.remove(), 8)
        XCTAssertEqual(heap.remove(), 12)
        XCTAssertEqual(heap.remove(), 16)
        XCTAssertEqual(heap.remove(), 19)
    }
    
    func testRemoveSingle() {
        let values = [1]
        
        let heap = Heap(values: values, orientation: .min)
        
        XCTAssertEqual(heap.remove(), 1)
    }
}
