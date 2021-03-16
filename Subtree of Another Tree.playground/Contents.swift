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
    func isSubtree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        // 俩都不为空再继续
        guard let root = s, let sub = t else {
            // 俩都为空直接返回true
            if s == nil && t == nil {
                return true
            } else {
                // 一个空一个不空肯定不等
                return false
            }
        }
        
        // 直接相等那就直接是子树
        if isEqual(root, sub) {
            return true
        }
        
        // 不直接相等就子树再判断
        return isSubtree(root.left, sub) || isSubtree(root.right, sub)
    }
    
    /// 左右两棵树是否相等
    /// - Parameters:
    ///   - left: 左树
    ///   - right: 右树
    /// - Returns: 是否相等，true or false
    func isEqual(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        guard let left = s, let right = t else {
            if s == nil && t == nil {
                return true
            }
            return false
        }
        // value值要相等，且左右子树分别相等
        return left.val == right.val && isEqual(left.left, right.left) && isEqual(left.right, right.right)
    }
}

let tree = TreeNode(3,
                    TreeNode(4,
                             TreeNode(1,
                                      TreeNode(0),
                                      nil),
                             TreeNode(2)),
                    TreeNode(5))

let subTree = TreeNode(4,
                       TreeNode(1),
                       TreeNode(2))

Solution().isSubtree(tree, subTree)
