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
    
    /// 存储上次访问的值，也可以是node
    var last: Int? = nil
    
    /// 存储返回结果
    var result: [Int] = []
    
    /// 出现次数计数
    var count: Int = 0
    
    /// 当前的mode数字
    var mode: Int = 0
    
    func findMode(_ root: TreeNode?) -> [Int] {
        inorder(root)
        return result
    }
    
    /// 中序遍历，倒序计算mode
    /// - Parameter root: 根节点
    func inorder(_ root: TreeNode?) {
        guard let root = root else {
            return
        }
        
        // 倒序找到最大值开始比较
        inorder(root.right)
        if let last = last {
            // 如果和前一个值相同，则count + 1，由于中序遍历是有序数据，所以理论上可以加到最大出现次数
            if last == root.val {
                count += 1
            } else {
                // 和前一个值不同，则首次出现，置为1
                count = 1
            }
            
            if count == mode {
                // 如果count和出现最多次的一致，则添加元素
                result.append(root.val)
            } else if mode < count {
                // 如果count大于mode，则出现了更多次重复的数据，将结果置为出现最多次的数据，mode也做同步
                mode = count
                result = [root.val]
            } // mode 大于count，说明这个数字的重复次数还不到mode，不计入结果
        } else {
            if result.isEmpty {
                // 结果数组为空，初始化
                result = [root.val]
                count = 1
                mode = 1
            }
        }
        // 写last
        last = root.val
        inorder(root.left)
    }
}


let tree = TreeNode(1)

Solution().findMode(tree)
