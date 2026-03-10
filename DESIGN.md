# Design Document: Weaver

## 1. Introduction
Weaver is a lightweight, high-performance Swift library providing fundamental data structures and algorithms. It is designed to be a "standard library extension" for developers who need robust, generic implementations of essential building blocks that are missing from or require specific implementations beyond the Swift Standard Library.

## 2. High-Level Architecture
The library is architected as a modular collection of independent data structures. Each component is self-contained within the `Weaver` namespace, ensuring zero internal cross-dependencies where possible to maintain a small memory footprint and high maintainability.

### Technical Stack
- **Language:** Swift 5.6+
- **Build System:** Swift Package Manager (SPM)
- **Frameworks:** Foundation (minimal usage for core logic)
- **Platform:** Cross-platform (macOS, iOS, Linux, etc.)

## 3. Core Design Philosophies
- **Genericity:** All structures utilize Swift Generics to ensure type safety and reusability across different data types.
- **Performance-First:** Implementations prioritize optimal time complexity (e.g., O(1) for Queue operations, O(log N) for Heap operations).
- **Value vs. Reference Semantics:**
    - **Structs:** Used for `Heap`, `DisjointSet`, and `Grid` to leverage Swift’s value semantics, copy-on-write optimization, and thread safety.
    - **Classes:** Used for `Queue` (linked-list based) and `BinaryNode` where reference identity and recursive structures are more appropriate.
- **Idiomatic Swift:** Leveraging protocols like `ExpressibleByArrayLiteral` and `Comparable` to make the API feel native to the language.

## 4. Key Components

### Linear Structures
- **Queue**: A First-In-First-Out (FIFO) queue implemented as a singly-linked list.
    - **API:** `enqueue(_:)`, `dequeue()`, `isEmpty`, `count`.
    - **Complexity:** O(1) for both enqueue and dequeue.

### Hierarchical & Tree Structures
- **BinaryNode**: A reference-type node for manual tree construction.
    - **API:** `value`, `left`, `right`.
- **Heap**: A binary heap implementation that can be configured as either a Min-Heap or Max-Heap.
    - **API:** `insert(_:)`, `pop()`, `peek()`, `orientation`.
    - **Complexity:** O(log N) for insertion and extraction; O(N) for initialization (heapify).

### Set & Relationship Structures
- **DisjointSet**: A Union-Find implementation for tracking elements partitioned into disjoint sets.
    - **Optimization:** Uses **Path Compression** in `root(of:)` and **Union-by-Rank** in `union(node1:node2:)`.
    - **Complexity:** Nearly O(1) (amortized inverse Ackermann function) for connectivity checks and unions.

### Geometric & Grid Structures
- **Grid**: A utility for 2D matrix manipulation.
    - **API:** `adjacent(to:)`, `value(at:)`, subscripting via `Point`.
    - **Features:** Efficient neighbor lookups and coordinate-to-value mapping.

## 5. Technical Specifications

### Error Handling
The library favors "fail-fast" or "safe-return" patterns:
- Optional returns (e.g., `dequeue() -> T?`, `peek() -> T?`) instead of throwing errors or crashing on empty structures.
- Precondition checks (implied via array indexing) for bounds-sensitive operations in `Grid` and `DisjointSet`.

### Concurrency Model
As a low-level data structure library, Weaver does not enforce internal locking. Thread safety is the responsibility of the consumer. Value-type components (`Heap`, `DisjointSet`, `Grid`) provide inherent safety when used as local variables or passed-by-value.

### Memory Management
- **Linked Structures:** `Queue` manages a chain of internal `Node` classes.
- **Contiguous Memory:** `Heap` and `DisjointSet` utilize `Array` as their backing store to maximize cache locality and performance.

## 6. Testing Infrastructure
The project follows a strict unit testing protocol using **XCTest**.
- **Unit Tests:** Located in `Tests/WeaverTests/`.
- **Coverage:** Focuses on edge cases (empty structures, single-element structures, large-scale operations).
- **Validation:** Ensures algorithmic correctness (e.g., Heap property preservation after multiple pops).

## 7. Performance & Scalability Considerations
- **Space Complexity:** All structures are optimized to O(N) space complexity relative to the number of elements.
- **Growth:** Backing arrays for `Heap` and `DisjointSet` leverage Swift's internal array growth strategy (geometric expansion) to minimize reallocations.
- **Inlining:** Methods are designed to be easily inlined by the Swift compiler for maximum runtime performance.
