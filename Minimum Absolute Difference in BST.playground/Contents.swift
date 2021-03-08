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
    
    var minDiff = Int.max
    var last: Int?
    
    func getMinimumDifference(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        // 前序先找到最小值
        getMinimumDifference(root.left)
        // 如果有前序节点，减一下
        if let last = last {
            minDiff = min(abs(root.val - last), minDiff)
        }
        // 替换前序节点值
        last = root.val
        // 找右边节点
        getMinimumDifference(root.right)
        
        return minDiff
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
}

/**
 [236,104,701,null,227,null,911]
 */
let tree = TreeNode(3,
                    TreeNode(1,
                             nil,
                             TreeNode(2)),
                    TreeNode(7,
                             nil,
                             TreeNode(9)))


Solution().getMinimumDifference(tree)
Solution().sumBST(tree)
