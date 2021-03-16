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

// 标准前序遍历，终止条件为俩节点都为空，只有有一边节点不为空，就创建新节点并写入值
// 两边有值，直接相加到新节点
// 一边有值，相加到新节点
// 两边为空，返回空
class Solution {
    func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
        if root1 == nil && root2 == nil {
            return nil
        }
        
        var mergeValue = 0
        
        if let left = root1 {
            mergeValue += left.val
        }
        
        if let right = root2 {
            mergeValue += right.val
        }
        
        let root = TreeNode(mergeValue)
        
        root.left = mergeTrees(root1?.left, root2?.left)
        root.right = mergeTrees(root1?.right, root2?.right)
        return root
    }
}
