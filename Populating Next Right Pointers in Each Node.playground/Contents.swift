import UIKit

public class Node {
    public var val: Int
    public var left: Node?
    public var right: Node?
    public var next: Node?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.next = nil
    }
}

class Solution {
    func connect(_ root: Node?) -> Node? {
        guard let root = root else {
            return nil
        }
        
        connecTwoNode(root.left, root.right)
        return root
    }
    
    func connecTwoNode(_ left: Node?, _ right: Node?) {
        guard let left = left, let right = right else {
            return
        }
        
        left.next = right
        
        connecTwoNode(left.left, left.right)
        connecTwoNode(right.left, right.right)
        connecTwoNode(left.right, right.left)
    }
}
