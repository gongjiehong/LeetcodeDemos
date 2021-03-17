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
    func pruneTree(_ root: TreeNode?) -> TreeNode? {
        // 骚写法，执行完左所有右子树剪枝后如果头结点还是0，则自身也被剪掉
        if !nodeContainsOne(root), root?.left == nil, root?.right == nil {
            return nil
        }
        return root
    }
    
    /// 判断子树是否有1，如果有，则保留继续向下递归，如果没有，则剪枝
    /// - Parameter root: 节点
    /// - Returns: 有1 true，没有1false
    func nodeContainsOne(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return false
        }
        
        let leftContainsOne = nodeContainsOne(root.left)
        let rightContainsOne = nodeContainsOne(root.right)
        if !leftContainsOne {
            root.left = nil
        }
        
        if !rightContainsOne {
            root.right = nil
        }
        
        // 这里只要任意一个条件成立，证明当前节点有1
        return root.val == 1 || leftContainsOne || rightContainsOne
    }
}

let tree = TreeNode(1,
                    TreeNode(0,
                             TreeNode(0),
                             TreeNode(0)),
                    TreeNode(1,
                             TreeNode(0),
                             TreeNode(1)))

Solution().pruneTree(tree)
