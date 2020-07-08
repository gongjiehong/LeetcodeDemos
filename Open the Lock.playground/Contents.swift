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

class Solution {
    func openLock(_ deadends: [String], _ target: String) -> Int {
        // 用于存储每一次处理的上下八种可能
        var queue: [String] = []
        // 存储已经走过的路径和死路，回头路不走（不是最优，而且会死循环），死路也不能走
        var visitedSet: Set<String> = Set<String>()
        for deadend in deadends {
            visitedSet.insert(deadend)
        }
        
        let start = "0000"
        queue.append(start)

        var step = 0
        
        while !queue.isEmpty {
            let size = queue.count
            print(visitedSet.count)
            // 遍历现有队列，扩散队列
            for _ in 0..<size {
                let current = queue.removeFirst()
                
                // 找到，终止，返回目前步数
                if current == target {
                    return step
                }
                
                // 如果已经存在，跳过不处理,不存在则加入已处理路径中
                if visitedSet.contains(current) {
                    continue
                } else {
                    visitedSet.insert(current)
                }
                
                // 算出前后各4种可能并加入队列，处理过的不加，死路也不加
                for index in 0..<4 {
                    let up = plusOne(code: current, index: index)
                    if !visitedSet.contains(up) {
                        queue.append(up)
                    }
                    
                    let down = minusOne(code: current, index: index)
                    if !visitedSet.contains(down) {
                        queue.append(down)
                    }
                }
            }
            
            step += 1
        }
        
        return -1
    }
    
    func plusOne(code: String, index: Int) -> String {
        // 调用compactMap保证没一个Character能都转为Int，效率其实挺低下的
        var result = code.compactMap { $0.wholeNumberValue }
        if result[index] == 9 {
            result[index] = 0
        } else {
            result[index] = result[index] + 1
        }
        // 先转成String数组，再join，也是效率低下，不可取
        return result.map{String($0)}.joined()
    }
    
    func minusOne(code: String, index: Int) -> String {
        var result = code.compactMap { $0.wholeNumberValue }
        if result[index] == 0 {
            result[index] = 9
        } else {
            result[index] = result[index] - 1
        }
        return result.map{String($0)}.joined()
    }
}

Solution().openLock(["0201","0101","0102","1212","2002"], "0202")
