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
    func increasingBST(_ root: TreeNode?) -> TreeNode? {
        newHead = nil
        inorder(root)
        return newHead
    }
    
    var newHead: TreeNode?
    var last: TreeNode?
    
    func inorder(_ root: TreeNode?) {
        guard let root = root else {
            return
        }
        inorder(root.left)
        if newHead == nil {
            newHead = TreeNode(root.val)
            last = newHead
        } else {
            let newNode = TreeNode(root.val)
            last?.right = newNode
            last = newNode
        }
        inorder(root.right)
    }
}



let tree = TreeNode(5,
                    TreeNode(3,
                             TreeNode(2,
                                      TreeNode(1),
                                      nil),
                             TreeNode(4)),
                    TreeNode(6,
                             nil,
                             TreeNode(8,
                                      TreeNode(7),
                                      TreeNode(9))))


Solution().increasingBST(tree)
