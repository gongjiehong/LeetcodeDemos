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
    var maxSum: Int = 0
    
    func maxSumBST(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
//        getValidSubBST(root)
        
        return maxSum
    }
    
    func getValidSubBST(_ root: TreeNode?, min: TreeNode?, max: TreeNode?) -> TreeNode? {
        // 空树，直接返回true
        guard let node = root else {
            return root
        }
        
        // 右子树，如果有节点值小于等于最小节点，则不是合法BST，此时max肯定为空
        if let min = min, min.val >= node.val {
            return nil
        }
        
        // 左子树，如果有节点值大于等于最大节点，则不是合法BST，此时min肯定为空
        if let max = max, max.val <= node.val {
            return nil
        }
        
        // 这里拆分开写，实际过程中直接在return写方法，尾递归对栈的占用会优秀很多
        // 验证左子树，min 始终为nil
        let leftBST = getValidSubBST(node.left, min: min, max: node)
        
        // 验证右子树，max 始终为nil
        let rightBST = getValidSubBST(node.right, min: node, max: max)
        
        if leftBST != nil {
            print(leftBST?.val)
        }
        
        if rightBST != nil {
            print(leftBST?.val)
        }
        return leftBST
    }
    
    func sumBST(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        var result = 0
        result += root.val
        result += sumBST(root.left)
        result += sumBST(root.right)
        return result
    }
    
    
    func isValidBST(_ root: TreeNode?) -> Bool {
        return isValidBST(root, min: nil, max: nil)
    }
    
    func isValidBST(_ root: TreeNode?, min: TreeNode?, max: TreeNode?) -> Bool {
        // 空树，直接返回true
        guard let node = root else {
            return true
        }
        
        // 右子树，如果有节点值小于等于最小节点，则不是合法BST，此时max肯定为空
        if let min = min, min.val >= node.val {
            return false
        }
        
        // 左子树，如果有节点值大于等于最大节点，则不是合法BST，此时min肯定为空
        if let max = max, max.val <= node.val {
            return false
        }
        
        // 这里拆分开写，实际过程中直接在return写方法，尾递归对栈的占用会优秀很多
        // 验证左子树，min 始终为nil
        let leftIsValid = isValidBST(node.left, min: min, max: node)
        
        // 验证右子树，max 始终为nil
        let rightIsValid = isValidBST(node.right, min: node, max: max)
        
        return leftIsValid && rightIsValid
    }
}

