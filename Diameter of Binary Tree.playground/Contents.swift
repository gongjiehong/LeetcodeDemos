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

// 此问题实际上是某个节点左子树深度加右子树深度的和然后再取max
class Solution {
    
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        traversal(root)
        return result
    }
    
    var result = 0
    
    func traversal(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        let leftMaxDepth = traversal(root.left)
        let rightMaxDepth = traversal(root.right)
        
        result = max(result, leftMaxDepth + rightMaxDepth)
        return max(leftMaxDepth + 1, rightMaxDepth + 1)
    }
}


let tree = TreeNode(1,
                    TreeNode(2,
                             TreeNode(4),
                             TreeNode(5)),
                    TreeNode(3))

Solution().diameterOfBinaryTree(tree)
