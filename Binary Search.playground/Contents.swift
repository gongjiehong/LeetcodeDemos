import UIKit

/// 零，二分查找框架
//int binarySearch(int[] nums, int target) {
//    int left = 0, right = ...;
//
//    while(...) {
//        int mid = left + (right - left) / 2;
//        if (nums[mid] == target) {
//            ...
//        } else if (nums[mid] < target) {
//            left = ...
//        } else if (nums[mid] > target) {
//            right = ...
//        }
//    }
//    return ...;
//}

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
/// 暴力查找
//        for (index, value) in nums.enumerated() {
//            if value == target {
//                return index
//            }
//        }
//        return -1
    
        /// 二分法
        // 起点索引
        var left = 0
        // 终点索引
        var right = nums.count - 1

        // 上面终点索引是最后一个元素的索引，所以这里需要小于等于
        while left <= right {
            let mid = left + (right - left) / 2
            if nums[mid] == target {
                return mid
            } else if nums[mid] < target {
                left = mid + 1
            } else if nums[mid] > target {
                right = mid - 1
            }
        }
        
        return -1
    }
}

Solution().search([-1,0,3,5,9,12], 9)
