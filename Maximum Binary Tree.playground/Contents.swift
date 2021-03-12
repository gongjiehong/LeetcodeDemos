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
    func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
        return buildNode(nums, start: 0, end: nums.count - 1)
    }
    
    func buildNode(_ nums: [Int], start: Int, end: Int) -> TreeNode? {
        // 终止条件，起始索引大于终止索引
        guard start <= end else {
            return nil
        }
        
        // 找到start和end中的最大值
        let (index, value) = getMaxIndex(nums, start: start, end: end)
        
        // 组装头结点
        let node = TreeNode(value)

        // 遍历添加左节点
        node.left = buildNode(nums, start: start, end: index - 1)
        // 遍历添加右节点
        node.right = buildNode(nums, start: index + 1, end: end)
        return node
    }
    
    // 内联，节约内存
    @inlinable
    func getMaxIndex(_ nums: [Int], start: Int, end: Int) -> (index: Int, value: Int) {
        var resultIndex = start
        var maxValue = Int.min
        for index in start...end {
            let value = nums[index]
            if value > maxValue {
                maxValue = value
                resultIndex = index
            }
        }
        return (resultIndex, maxValue)
    }
}


Solution().constructMaximumBinaryTree([1,2,3,6,5,0])
