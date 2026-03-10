import Foundation
import Testing
@testable import Weaver

@Suite("DisjointSet Tests")
struct DisjointSetTests {
    @Test func testInit() throws {
        var subject = DisjointSet(size: 4)
        
        for i in 0..<4 {
            let root = subject.root(of: i)
            #expect(root == i)
        }
    }
    
    @Test func testUnion() throws {
        var subject = DisjointSet(size: 4)
        
        subject.union(node1: 1, node2: 3)
        
        let root1 = subject.root(of: 1)
        let root3 = subject.root(of: 3)
        #expect(root1 == root3)
    }
    
    @Test func testConnected() throws {
        var subject = DisjointSet(size: 4)
        
        subject.union(node1: 1, node2: 3)
        
        let c12 = subject.connected(node1: 1, node2: 2)
        #expect(!c12)
        let c10 = subject.connected(node1: 1, node2: 0)
        #expect(!c10)
        let c32 = subject.connected(node1: 3, node2: 2)
        #expect(!c32)
        let c30 = subject.connected(node1: 3, node2: 0)
        #expect(!c30)
        let c13 = subject.connected(node1: 1, node2: 3)
        #expect(c13)
    }
}
