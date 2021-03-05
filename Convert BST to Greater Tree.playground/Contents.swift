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
    
    func convertBST(_ root: TreeNode?) -> TreeNode? {

        inorder(root)
        
        return root
    }
    
    var sum = 0
    func inorder(_ root: TreeNode?)  {
        guard let root = root else {
            return
        }
        // 右节点从最大开始累加
        inorder(root.right)
        root.val += sum
        sum = root.val
        // 右边的节点肯定比左节点大，右节点已经累加完成，再和左节点相加即可
        inorder(root.left)
    }
    
    func printTree(_ tree: TreeNode?) -> [[String]] {
        // 先获取数深度
        let depth = getTreeDepth(tree)
        
        // 获取输出时的宽度，2的n次方减一
        let length = (pow(2, depth) as NSDecimalNumber).intValue - 1
        
        // 初始化结果数组
        var result = [[String]](repeating: [String](repeating: "", count: length), count: depth)
        
        // 递归修改对应位置的值
        printTree(tree, output: &result, row: 0, start: 0, end: length)
        return result
    }
    
    func printTree(_ node: TreeNode?, output: inout [[String]], row: Int, start: Int, end: Int) {
        guard let root = node else {
            return
        }
        
        // 找中间位置
        let column = (start + end) / 2
        output[row][column] = "\(root.val)"
        
        // 左边节点，加一行，中间二分
        printTree(root.left, output: &output, row: row + 1, start: start, end: column)
        // 右边节点，加一行，中间二分
        printTree(root.right, output: &output, row: row + 1, start: column, end: end)
    }
    
    /// 获取最大深度
    /// - Parameter root: 根节点
    /// - Returns: 深度
    func getTreeDepth(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        let leftDepth = getTreeDepth(root.left)
        let rightDepth = getTreeDepth(root.right)
        
        let depth = max(leftDepth, rightDepth)
        
        // 加上当前节点的 1
        return depth + 1
    }
}

/*[4,1,6,0,2,5,7,null,null,null,3,null,null,null,8]*/
let tree = TreeNode(4,
                    TreeNode(1,
                             TreeNode(-1000,
                                      nil,
                                      nil),
                             TreeNode(2,
                                      nil,
                                      TreeNode(3))),
                    TreeNode(6,
                             TreeNode(5,
                                      nil,
                                      nil),
                             TreeNode(7,
                                      nil,
                                      TreeNode(8))))

let solution = Solution()
let newTree = solution.convertBST(tree)
let newTreePrint = solution.printTree(newTree)
for array in newTreePrint {
    print(array)
}
