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
    func isBalanced(_ root: TreeNode?) -> Bool {
        traversal(root)
        return isBanlanced
    }
    
    var isBanlanced = true
    func traversal(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        let left = traversal(root.left)
        let right = traversal(root.right)
        
        // 在计算二叉树深度的过程中，有任意左右子树不平衡，则不平衡
        if abs(left - right) > 1 {
            isBanlanced = false
        }
        
        return max(left, right) + 1
    }
}


let tree = TreeNode(3,
                    TreeNode(9),
                    TreeNode(20,
                             TreeNode(15),
                             TreeNode(7,
                                      TreeNode(3), nil)))


Solution().traversal(tree)
Solution().isBalanced(tree)
