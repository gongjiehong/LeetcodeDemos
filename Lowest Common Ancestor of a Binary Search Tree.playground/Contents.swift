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
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        return inorder(root, p, q)
    }
    
    func inorder(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root, let p = p, let q = q else {
            return nil
        }

        // BST特性，如果root值小于两个值，说明p，q，都比当前节点大，在右子树查找
        if root.val < p.val && root.val < q.val {
            return inorder(root.right, p, q)
            // 如果root值大于两个值，说明p，q，都比当前节点小，在左子树查找
        } else if root.val > p.val && root.val > q.val {
            return inorder(root.left, p, q)
        } else {
            return root
        }
        
    }
}

let tree = TreeNode(6,
                    TreeNode(2,
                             TreeNode(0),
                             TreeNode(4,
                                      TreeNode(3),
                                      TreeNode(5))),
                    TreeNode(8,
                             TreeNode(7),
                             TreeNode(9)))
//let tree = TreeNode(2, TreeNode(1), nil)

Solution().lowestCommonAncestor(tree, TreeNode(2), TreeNode(9))?.val


