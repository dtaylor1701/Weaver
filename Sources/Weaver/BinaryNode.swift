import Foundation

class BinaryNode<T> {
    var value: T
    var left: BinaryNode<T>?
    var right: BinaryNode<T>?
    
    init(value: T, left: BinaryNode<T>?, right: BinaryNode<T>?) {
        self.value = value
        self.left = left
        self.right = right
    }
}
