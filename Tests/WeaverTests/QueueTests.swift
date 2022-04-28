//
//  QueueTests.swift
//  
//
//  Created by David Taylor on 4/27/22.
//

import XCTest
import Weaver

class QueueTests: XCTestCase {

    func testCount() {
        let queue = Queue<Int>()
        
        XCTAssertEqual(queue.count, 0)
        
        queue.enqueue(2)
        
        XCTAssertEqual(queue.count, 1)
        
        _ = queue.dequeue()
        
        XCTAssertEqual(queue.count, 0)
    }
    
    func testDequeue() {
        let queue = Queue<Int>()
        
        XCTAssertNil(queue.dequeue())
        
        queue.enqueue(4)
        
        XCTAssertEqual(queue.dequeue(), 4)
    }

}
