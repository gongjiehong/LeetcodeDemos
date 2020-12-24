import UIKit

class Solution {
    
//    /// 暴力解法，直接穷举出所有情况，计算Int.max次
//    /// - Parameter K: 末尾0的个数
//    /// - Returns: 有多少种情况
//    func preimageSizeFZF(_ K: Int) -> Int {
//        var result = 0
//
//        for temp in 0...Int.max {
//            if trailingZeroes(number: temp) != K {
//                continue
//            } else {
//                result += 1
//            }
//        }
//
//        return result
//    }
    
    
    /// 二分查找算法，找左右边界
    /// - Parameter K: 末尾0的个数
    /// - Returns: 有多少种情况
    func preimageSizeFZF(_ K: Int) -> Int {
        return rightBound(target: K) - leftBound(target: K) + 1
    }
    
    func leftBound(target: Int) -> Int {
        var low = 0
        var high = Int.max
        while low < high {
            let middle = low + (high - low) / 2
            if trailingZeroes(number: middle) < target {
                low = middle + 1
            } else if trailingZeroes(number: middle) > target {
                high = middle
            } else {
                high = middle
            }
        }
        return low
    }
    
    func rightBound(target: Int) -> Int {
        var low = 0
        var high = Int.max
        while low < high {
            let middle = low + (high - low) / 2
            if trailingZeroes(number: middle) < target {
                low = middle + 1
            } else if trailingZeroes(number: middle) > target {
                high = middle
            } else {
                low = middle + 1
            }
        }
        return low - 1
    }
    
    func trailingZeroes(number: Int) -> Int {
        var result = 0
        var divisor = 5
        
        while divisor <= number {
            result += number / divisor
            divisor *= 5
        }
        return result
    }
}


print(Solution().preimageSizeFZF(9530))
