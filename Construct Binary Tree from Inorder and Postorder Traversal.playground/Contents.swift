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
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        return buildTree(inorder, 0, inorder.count - 1,
                         postorder, 0, postorder.count - 1)
    }
    
    func buildTree(_ inorder: [Int],
                   _ inStart: Int,
                   _ inEnd: Int,
                   _ postorder: [Int],
                   _ postStart: Int,
                   _ postEnd: Int) -> TreeNode?
    {
        guard inStart <= inEnd else {
            return nil
        }
        
        let rootValue = postorder[postEnd]
        let root = TreeNode(rootValue)
        
        var index = 0
        
        for temp in inStart...inEnd {
            if inorder[temp] == rootValue {
                index = temp
                break
            }
        }
        
        let leftSize = index - inStart
        root.left = buildTree(inorder, inStart, index - 1,
                              postorder, postStart, postStart + leftSize - 1)
        root.right = buildTree(inorder, index + 1, inEnd,
                               postorder, postStart + leftSize, postEnd - 1)
        return root
    }

    var preorder: [Int] = [Int]()
    var inorder: [Int] = [Int]()
    var postorder: [Int] = [Int]()
    
    func traversal(_ node: TreeNode?) {
        guard let node = node else {
            return
        }
        
        // 前序
        preorder.append(node.val)
        
        traversal(node.left)
        
        // 中序
        inorder.append(node.val)
        
        traversal(node.right)
        
        // 后续
        postorder.append(node.val)
    }
}

let tree = TreeNode(3,
                    TreeNode(9),
                    TreeNode(20,
                             TreeNode(15),
                             TreeNode(7)))


let solution = Solution()
solution.traversal(tree)
print(solution.preorder)
print(solution.inorder)
print(solution.postorder)

