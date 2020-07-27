import UIKit

class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        let left = searchLeftBound(nums, target)
        let right = searchRightBound(nums, target)
        return [left, right]
    }
    
    func searchLeftBound(_ nums: [Int], _ target: Int) -> Int {
//        // 暴力解法, 复杂度O(n)
//        for (index, value) in nums.enumerated() {
//            if value == target {
//                return index
//            }
//        }
//        return -1
        var left = 0
        var right = nums.count - 1
        while left <= right {
            let mid = left + (right - left) / 2
            if target == nums[mid] {
                // 收缩右侧边界, 向左靠拢
                right = mid - 1
            } else if nums[mid] > target {
                // 搜索区间变成[left, mid - 1], 相当于也是收缩右侧边界, 向左靠拢
                right = mid - 1
            } else if nums[mid] < target {
                // 收缩左侧边界, [mid + 1, right]
                left = mid + 1
            }
        }
        
        // left >= nums.count 没有元素的时候右侧越界, nums[left] != target 右往左，第一个元素不是target
        if left >= nums.count || nums[left] != target {
            return -1
        }
        
        return left
    }
    
    func searchRightBound(_ nums: [Int], _ target: Int) -> Int {
//        // 暴力解法, 复杂度O(n)
//        var index = nums.count - 1
//        while index >= 0 {
//            if target == nums[index] {
//                return index
//            }
//            index -= 1
//        }
//
//        return -1
        var left = 0
        var right = nums.count - 1
        while left <= right {
            let mid = left + (right - left) / 2
            if nums[mid] == target {
                // [mid + 1, right]
                left = mid + 1
            } else if nums[mid] > target {
                // [left, mid - 1]
                right = mid - 1
            } else if nums[mid] < target {
                // [mid + 1, right]
                left = mid + 1
            }
        }
            
        if right < 0 || nums[right] != target {
            return -1
        }
        
        return right
    }
}

Solution().searchLeftBound([5,7,7,8,8,10], 8)
Solution().searchRightBound([5,7,7,8,8,10], 8)
