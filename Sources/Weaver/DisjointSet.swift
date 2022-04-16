import Foundation

class DisjointSet {
    private var roots: [Int] = []
    private var ranks: [Int] = []
    
    init(size: Int) {
        for i in 0..<size {
            roots.append(i)
            ranks.append(1)
        }
    }
    
    func root(of node: Int) -> Int {
        if node == roots[node] {
            return node
        }
        
        let result = root(of: roots[node])
        roots[node] = result
        return result
    }
    
    func union(node1: Int, node2: Int) {
        let root1 = root(of: node1)
        let root2 = root(of: node2)
        
        guard root1 != root2 else { return }
        
        if ranks[root1] > ranks[root2] {
            roots[root2] = root1
        } else if ranks[root2] > ranks[root1] {
            roots[root1] = root2
        } else {
            roots[root2] = root1
            ranks[root1] += 1
        }
    }
    
    func connected(node1: Int, node2: Int) -> Bool {
        return root(of: node1) == root(of: node2)
    }
}
