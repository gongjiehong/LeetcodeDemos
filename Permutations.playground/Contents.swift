import UIKit

class Solution {
    // 装结果的容器二位数组
    var results = [[Int]]()
    
    func permute(_ nums: [Int]) -> [[Int]] {
        // 空策略数组
        let tempSort = [Int]()
        // 执行选择
        backTrack(nums, track: tempSort)
        print(results.count)
        return results
    }
    
    func backTrack(_ nums: [Int], track: [Int]) {
        // 组装为可变路径
        var track = track
        
        // 如果选择路径和原有数量一致，表示完成本次排列，加入结果容器中并结束
        if track.count == nums.count {
            results.append(track)
            return
        }
        
        for tempNum in nums {
            // 如果路径中已经存在当前数字，跳过本数字继续执行
            if track.contains(tempNum) {
                continue
            }
            
            // 排列中加入当前元素
            track.append(tempNum)
            // 进入下一层的决策树，已有的排除，没有的加入，如果数量一致了，循环结束
            backTrack(nums, track: track)
            // 取消选择，回到父节点继续
            track.removeLast()
        }
    }
}

Solution().permute([1,2,3,4,5])
