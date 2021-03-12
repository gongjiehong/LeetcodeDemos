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
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        traversal(root)
        return root
    }
    
    func traversal(_ root: TreeNode?) {
        guard let root = root else {
            return
        }
        
        swap(&root.left, &root.right)
        traversal(root.left)
        traversal(root.right)
    }
}

let tree = TreeNode(4,
                    TreeNode(2,
                             TreeNode(1),
                             TreeNode(3)),
                    TreeNode(7,
                             TreeNode(6),
                             TreeNode(9)))


Solution().invertTree(tree)



