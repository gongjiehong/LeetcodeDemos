import UIKit

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() {
        self.val = 0
        self.left = nil
        self.right = nil
    }
    
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    
    public init(val: Int, left: TreeNode?, right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}


class Solution {
    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        var result: Int = 0

        // 空节点了，直接返回0
        guard let root = root else {
            return result
        }

        // 在范围内，直接先把结果加上
        if root.val >= low && root.val <= high {
            result += root.val
        }

        // 大于low，从左节点直到找到<=low的为止
        if root.val > low {
            result += rangeSumBST(root.left, low, high)
        }

        // 小于high，从右节点找到>=hight的为止
        if root.val < high {
            result += rangeSumBST(root.right, low, high)
        }

        return result
    }
}

Solution().rangeSumBST(TreeNode(val: 10,
                                left: TreeNode(val: 5,
                                               left: TreeNode(val: 3,
                                                              left: TreeNode(1),
                                                              right: nil),
                                               right: TreeNode(val: 7,
                                                               left: TreeNode(6),
                                                               right: nil)),
                                right: TreeNode(val: 15,
                                                left: TreeNode(13),
                                                right: TreeNode(18))),
                       6,
                       10)
