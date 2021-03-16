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

// depth 为1时创建新节点并将原节点置为左节点，新节点值为val
// depth 为2时左右节点分别为新左节点的左节点和新右节点的右节点，新节点值为val
// depth > 2 时递归上面的逻辑
class Solution {
    func addOneRow(_ root: TreeNode?, _ val: Int, _ depth: Int) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        
        switch depth {
        case 1:
            let node = TreeNode(val)
            node.left = root
            return node
        case 2:
            let left = root.left
            let right = root.right
            let newLeft = TreeNode(val, left, nil)
            let newRight = TreeNode(val, nil, right)
            root.left = newLeft
            root.right = newRight
            return root
        default:
            addOneRow(root.left, val, depth - 1)
            addOneRow(root.right, val, depth - 1)
            return root
        }
    }

}

let tree = TreeNode(3,
                    TreeNode(4,
                             TreeNode(1,
                                      TreeNode(0),
                                      nil),
                             TreeNode(2)),
                    TreeNode(5,
                             TreeNode(9),
                             TreeNode(10)))

Solution().addOneRow(tree, 10086, 2)
