# Weaver

Weaver is a Swift package providing a robust collection of fundamental data structures and algorithms. Designed for performance and ease of use, it offers clean, generic implementations of essential building blocks for Swift applications.

## Components

The library is organized into logical data structure categories:

### Linear Structures
- **Queue**: A generic First-In-First-Out (FIFO) queue implementation supporting efficient enqueue and dequeue operations. It conforms to `ExpressibleByArrayLiteral` for convenient initialization.

### Hierarchical & Tree Structures
- **BinaryNode**: A simple, generic building block for constructing binary trees.
- **Heap**: A highly configurable min-priority or max-priority heap (Priority Queue) implementation. It includes automatic `heapify` functionality and efficient insertion/extraction.

### Set & Relationship Structures
- **DisjointSet**: An optimized implementation of the Disjoint-Set (Union-Find) data structure. It features path compression and union-by-rank to provide near-constant time operations for grouping and connectivity checks.

### Geometric & Grid Structures
- **Grid**: A 2D coordinate system utility for managing values in a matrix. It includes built-in support for point-based indexing and calculating adjacent neighbors.

## Installation

### Swift Package Manager

Add Weaver to your project by adding it to your `Package.swift` dependencies:

```swift
dependencies: [
    .package(url: "https://github.com/ramble-logic/weaver.git", from: "1.0.0")
]
```

Then, include `Weaver` in your target's dependencies:

```swift
.target(
    name: "YourTarget",
    dependencies: ["Weaver"]
)
```

## Usage

### Queue
```swift
let queue: Queue<Int> = [1, 2, 3]
queue.enqueue(4)
let first = queue.dequeue() // 1
```

### Heap (Priority Queue)
```swift
var minHeap = Heap([3, 1, 4, 2], orientation: .min)
minHeap.insert(0)
let smallest = minHeap.pop() // 0
```

### Disjoint Set
```swift
var ds = DisjointSet(size: 10)
ds.union(node1: 1, node2: 2)
let isConnected = ds.connected(node1: 1, node2: 2) // true
```

### Grid
```swift
let matrix = [
    [1, 2],
    [3, 4]
]
let grid = Grid(matrix)
let neighbors = grid.adjacent(to: Point(i: 0, j: 0)) // [Point(i: 1, j: 0), Point(i: 0, j: 1)]
```

## Dependencies

Weaver has no external dependencies beyond the Swift Standard Library and Foundation.

## License

This project is maintained by Ramble Logic.
