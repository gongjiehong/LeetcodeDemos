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
    
//    /**
//     这个不是算法，只是取巧，先按照前序遍历的把节点放入数组，然后改前后指针
//     */
//    func flatten(_ root: TreeNode?) {
//        traversal(root)
//
//        for index in 0..<nodes.count {
//            if index < nodes.count - 1 {
//                nodes[index].left = nil
//                nodes[index].right = nodes[index + 1]
//            }
//        }
//    }
//
//    var nodes = [TreeNode]()
//
//    func traversal(_ root: TreeNode?) {
//        guard let root = root else {
//            return
//        }
//        nodes.append(root)
//        traversal(root.left)
//        traversal(root.right)
//    }
    
    func flatten(_ root: TreeNode?) {
        guard let root = root else {
            return
        }
        
        flatten(root.left)
        flatten(root.right)
        
        let left = root.left
        let right = root.right
        
        root.left = nil
        root.right = left
        
        var temp = root
        
        while let tempRight = temp.right {
            temp = tempRight
        }
        
        temp.right = right
    }
}



let tree = TreeNode(1,
                    TreeNode(2,
                             TreeNode(3),
                             TreeNode(4)),
                    TreeNode(5,
                             nil,
                             TreeNode(6)))



Solution().flatten(tree)
