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
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
        // 先把二叉查找树搞成有序数组，这里是升序
        let array = bstToArray(root)
        var left = 0
        var right = array.count - 1
        
        // 滑动窗口算法
        while left < right {
            let twoSum = array[left] + array[right]
            
            if twoSum == k {
                // 如果等于直接返回
                return true
            } else if twoSum < k {
                // 比预期小，左窗口右移
                left += 1
            } else {
                // 比预期大，右窗口右移
                right -= 1
            }
        }
        return false
    }
    
    func bstToArray(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        guard let root = root else {
            return result
        }
        
        inorderBST(root, result: &result)
        return result
    }
    
    func inorderBST(_ root: TreeNode?, result: inout [Int]) {
        guard let root = root else {
            return
        }
        
        inorderBST(root.left, result: &result)
        result.append(root.val)
        inorderBST(root.right, result: &result)
    }
}

let tree = TreeNode(4,
                    TreeNode(1,
                             TreeNode(-100,
                                      nil,
                                      nil),
                             TreeNode(2,
                                      nil,
                                      TreeNode(3))),
                    TreeNode(6,
                             TreeNode(5,
                                      nil,
                                      nil),
                             TreeNode(7,
                                      nil,
                                      TreeNode(8))))

Solution().findTarget(tree, 12)
Solution().bstToArray(tree)
