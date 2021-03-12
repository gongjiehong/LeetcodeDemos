import UIKit

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}


class Solution {
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        if let left = root?.left {
            return traversal(left)
        } else if let right = root?.right {
            return traversal(right)
        } else {
            return 2 + max(traversal(root?.left), traversal(root?.right))
        }
    }
    
    var maxPath: Int = 1
    
    func traversal(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        if let left = root.left {
            return 1 + traversal(left)
        } else if let right = root.right {
            return 1 + traversal(right)
        } else {
            return 1 + max(traversal(root.left), traversal(root.right))
        }
    }
}


let tree = TreeNode(1,
                    TreeNode(2,
                             TreeNode(4),
                             TreeNode(5)),
                    TreeNode(3))

Solution().diameterOfBinaryTree(tree)
