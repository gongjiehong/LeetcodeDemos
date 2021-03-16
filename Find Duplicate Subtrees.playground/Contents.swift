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
    func findDuplicateSubtrees(_ root: TreeNode?) -> [TreeNode?] {
        traversal(root)
        return result
    }
    
    var result = [TreeNode]()
    
    var memo = [String: Int]()
    
    func traversal(_ root: TreeNode?) -> String {
        guard let root = root else {
            return "#"
        }
        
        let left = traversal(root.left)
        let right = traversal(root.right)
        let subTree = "\(left),\(right),\(root.val)"
        
        // 这里默认出现次数0，所以为了防止重复，默认为1
        let count = memo[subTree] ?? 0
        
        // 第二次出现，拿到的是前一次写入的1
        if count == 1 {
            result.append(root)
        }
        
        // 第一次出现，次数为1
        memo[subTree] = 1 + count
        
        return subTree
    }
}


// [2,1,11,11,null,1]

let tree = TreeNode(2,
                    TreeNode(1,
                             TreeNode(11),
                             nil),
                    TreeNode(11,
                             TreeNode(1),
                             nil))


Solution().findDuplicateSubtrees(tree)
