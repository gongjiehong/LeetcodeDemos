import UIKit

class Solution {
    func trailingZeroes(_ n: Int) -> Int {
        var result = 0
        var divisor = 5
        
        // 数字在每一个数量级可以分为多少个因子2和5
        // 因为2 4 6 8皆可，所以2这边肯定比5多的多，转换为只计算5
        while divisor <= n {
            result += n / divisor
            divisor *= 5 // 5(初始)，25，125，625，3125，15625
        }
        
        return result
    }
}

print(Solution().trailingZeroes(10000))
