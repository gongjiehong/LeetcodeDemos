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
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        // 节点为空，直接返回，啥也没删除
        guard let root = root else {
            return nil
        }
        
        if root.val == key {
            // 左子节点为空或者没有子节点，返回右子节点或者空
            if root.left == nil {
                return root.right
            }
            // 右子节点为空或者没有子节点，返回左子节点或者空
            if root.right == nil {
                return root.left
            }
            
            // 左右子节点都不为空，需要找到右子树的最小节点值来替换当前位置，或者左子树中最大的节点
            let minNode = getMinNode(root.right!)
            root.val = minNode.val
            root.right = deleteNode(root.right, minNode.val)
        } else if root.val < key {
            // 小于给定值，从右子树找
            root.right = deleteNode(root.right, key)
        } else if root.val > key {
            // 大于给定值，从左子树找
            root.left =  deleteNode(root.left, key)
        }
        return root
    }
    
    func getMinNode(_ node: TreeNode) -> TreeNode {
        var temp: TreeNode = node
        while let left = temp.left {
            temp = left
        }
        return temp
    }
    
//    func deleteNode(_ root: TreeNode?, _ key: Int, preNode: TreeNode?) -> TreeNode?{
//        guard let root = root else {
//            return nil
//        }
//
//        if root.val == key {
//            if root.left == nil {
//                return root.right
//            }
//
//            if root.right == nil {
//                return root.left
//            }
//        } else if root.val < key {
//            return deleteNode(root.right, key)
//        } else {
//            return deleteNode(root.left, key)
//        }
//    }
}
