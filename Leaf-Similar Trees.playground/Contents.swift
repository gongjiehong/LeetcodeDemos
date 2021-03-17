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
    func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        let left = leafValueSequence(root1)
        let right = leafValueSequence(root2)
        return left == right
    }
    /// 遍历，找到叶子节点并加入序列，最后判断两个序列是否相等
    func leafValueSequence(_ root: TreeNode?) -> [Int] {
        var temp: [Int] = []
        guard let root = root else {
            return temp
        }
                
        let left = leafValueSequence(root.left)
        let right = leafValueSequence(root.right)
        
        if root.left == nil, root.right == nil {
            temp.append(root.val)
        }
        
        return temp + left + right
    }
}

let left = TreeNode(3,
                    TreeNode(5,
                             TreeNode(6),
                             TreeNode(2,
                                      TreeNode(7),
                                      TreeNode(4))),
                    TreeNode(1,
                             TreeNode(9),
                             TreeNode(8)))


let right = TreeNode(3,
                    TreeNode(5,
                             TreeNode(6),
                             TreeNode(7)),
                    TreeNode(1,
                             TreeNode(4),
                             TreeNode(2,
                                      TreeNode(9),
                                      TreeNode(8))))


Solution().leafSimilar(left, right)
