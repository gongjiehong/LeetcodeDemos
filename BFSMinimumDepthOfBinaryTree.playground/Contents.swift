import UIKit

/// BFS 最小路径框架

//// 计算从起点 start 到终点 target 的最近距离
//int BFS(Node start, Node target) {
//    Queue<Node> q; // 核心数据结构
//    Set<Node> visited; // 避免走回头路
//
//    q.offer(start); // 将起点加入队列
//    visited.add(start);
//    int step = 0; // 记录扩散的步数
//
//    while (q not empty) {
//        int sz = q.size();
//        /* 将当前队列中的所有节点向四周扩散 */
//        for (int i = 0; i < sz; i++) {
//            Node cur = q.poll();
//            /* 划重点：这里判断是否到达终点 */
//            if (cur is target)
//            return step;
//            /* 将 cur 的相邻节点加入队列 */
//            for (Node x : cur.adj())
//            if (x not in visited) {
//                q.offer(x);
//                visited.add(x);
//            }
//        }
//        /* 划重点：更新步数在这里 */
//        step++;
//    }
//}

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
    func minDepth(_ root: TreeNode?) -> Int {
        // 套用公式，记录路径的队列
        var queue: [TreeNode] = []
        
        // 如果为空树，直接返回0
        guard let rootNode = root else {
            return 0
        }
        
        // 将起点加入队列
        queue.append(rootNode)
        
        // 起点也算一部，所以初始为1
        var step: Int = 1
        
        // 循环结束队列不为空，说明还有子节点，继续遍历
        while !queue.isEmpty {
            // 队列子节点数
            let size = queue.count
            // 从左到右遍历子节点，如果满足条件直接返回步数
            for _ in 0..<size {
                let current = queue.removeFirst()
                // 该节点为最终节点，结束条件为没有子节点了
                if current.left == nil && current.right == nil {
                    return step
                }
                
                // 左边有子节点，加入队列
                if let left = current.left {
                    queue.append(left)
                }
                
                // 右边有子节点，加入队列
                if let right = current.right {
                    queue.append(right)
                }
            }
            
            // 队列遍历完成，深度+1，此时如果队列不为空，还会继续循环
            step += 1
        }

        return step
    }
}

Solution().minDepth(TreeNode(1, TreeNode(2, TreeNode(4, nil, nil), nil), TreeNode(3, nil, TreeNode(5, nil, nil))))
