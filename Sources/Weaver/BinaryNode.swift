import Foundation

public class BinaryNode<T> {
    public var value: T
    public var left: BinaryNode<T>?
    public var right: BinaryNode<T>?
    
    public init(value: T, left: BinaryNode<T>?, right: BinaryNode<T>?) {
        self.value = value
        self.left = left
        self.right = right
    }
}
