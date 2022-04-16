import Foundation
import XCTest
@testable import Weaver

class DisjointSetTests: XCTestCase {
    func testInit() throws {
        let subject = DisjointSet(size: 4)
        
        for i in 0..<4 {
            XCTAssertEqual(subject.root(of: i), i)
        }
    }
    
    func testUnion() throws {
        let subject = DisjointSet(size: 4)
        
        subject.union(node1: 1, node2: 3)
        
        XCTAssertEqual(subject.root(of: 1), subject.root(of: 3))
    }
    
    func testConnected() throws {
        let subject = DisjointSet(size: 4)
        
        subject.union(node1: 1, node2: 3)
        
        XCTAssertFalse(subject.connected(node1: 1, node2: 2))
        XCTAssertFalse(subject.connected(node1: 1, node2: 0))
        XCTAssertFalse(subject.connected(node1: 3, node2: 2))
        XCTAssertFalse(subject.connected(node1: 3, node2: 0))
        XCTAssertTrue(subject.connected(node1: 1, node2: 3))
    }
}
