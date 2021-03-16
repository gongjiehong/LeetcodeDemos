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
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        guard let root = root else {
            return []
        }
        traversal(root, parent: nil, path: "")
        return resultArray
    }
    
    var resultArray = [String]()
    
    func traversal(_ root: TreeNode?, parent: TreeNode?, path: String) -> String {
        guard let root = root else {
            // 当前节点为空，而且父节点的左右子节点都为空，说明这是个叶子，此时可以加入路径
            if !resultArray.contains(path) && parent?.left == nil && parent?.right == nil {
                resultArray.append(path)
            }
            return path
        }
        var newPath = path
        if newPath.count > 0 {
            newPath += "->\(root.val)"
        } else {
            newPath = "\(root.val)"
        }
        
        traversal(root.left, parent: root, path: newPath)
        traversal(root.right, parent: root, path: newPath)
        return newPath
    }
}
