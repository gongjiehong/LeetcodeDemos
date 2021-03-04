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
    func isSymmetric(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        } else {
            return isSymmetricTree(root?.left, root?.right)
        }
    }
    
    func isSymmetricTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if let left = p, let right = q {
            // 不等，直接返回对称
            if left.val != right.val {
                return false
            } else {
                // 递归直至空节点
                return isSymmetricTree(left.left, right.right) && isSymmetricTree(left.right, right.left)
            }
        } else if p == nil, q == nil {
            // 俩空树直接对称
            return true
        } else {
            // 一个空一个不空，肯定不对称
            return false
        }
    }
}
