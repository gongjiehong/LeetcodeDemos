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
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        return buildTree(preorder, 0, preorder.count - 1, inorder, 0, inorder.count - 1)
    }
    
    func buildTree(_ preorder: [Int],
                   _ preStart: Int,
                   _ preEnd: Int,
                   _ inorder: [Int],
                   _ inStart: Int,
                   _ inEnd: Int) -> TreeNode?
    {
        guard preStart <= preEnd else {
            return nil
        }
        
        let rootValue = preorder[preStart]
        let root = TreeNode(rootValue)
        
        var index = 0
        for temp in inStart...inEnd {
            if inorder[temp] == rootValue {
                index = temp
                break
            }
        }
        
        let leftSize = index - inStart
        
        root.left = buildTree(preorder, preStart + 1, preStart + leftSize,
                              inorder, inStart, index - 1)
        root.right = buildTree(preorder, preStart + leftSize + 1, preEnd,
                               inorder, index + 1, inEnd)
        return root
    }
}
