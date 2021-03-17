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
    func insertIntoMaxTree(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        
        if root.val < val {
            let node = TreeNode(val, root, nil)
            return node
        }
        
        var current = root
        while let right = current.right, right.val > val {
            current = right
        }
        
        let right = current.right
        let node = TreeNode(val, nil, right)
        current.right = node
        return root
    }
}


let tree = TreeNode(5,
                    TreeNode(2,
                             nil,
                             TreeNode(1)),
                    TreeNode(4))

Solution().insertIntoMaxTree(tree, 3)
