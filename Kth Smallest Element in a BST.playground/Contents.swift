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
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        guard let root = root else {
            return 0
        }
        
        index = k
        
        traversal(root)
        return result
    }
    
    var index = 0
    var result = 0
    func traversal(_ root: TreeNode?) {
        guard let root = root else {
            return
        }
        traversal(root.left)
        index -= 1
        if index == 0 {
            result = root.val
            return
        }
        traversal(root.right)
    }
}
