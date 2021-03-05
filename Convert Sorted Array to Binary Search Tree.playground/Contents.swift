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
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        if nums.count == 0 {
            return nil
        } else {
            return _sortedArrayToBST(nums, start: 0, end: nums.count - 1)
        }
    }
    
    func _sortedArrayToBST(_ nums: [Int], start: Int, end: Int) -> TreeNode? {
        if start > end {
            return nil
        }
        let mid = (start + end) / 2
        let root = TreeNode(nums[mid])
        root.left = _sortedArrayToBST(nums, start: start, end: mid - 1)
        root.right = _sortedArrayToBST(nums, start: mid + 1, end: end)
        return root
    }
}


Solution().sortedArrayToBST([1,2,3,4,5,6,7,8,9,10,11,12,13])
