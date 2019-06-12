import UIKit

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 {
            return false
        } else if x == 0 {
            return true
        } else {
            let reversedNumber = reverse(x)
            return reversedNumber == x
        }
    }
    
    /// 反转正整数，此处场景只需要反转正整数，所以不考虑溢出的情况
    /// 如需反转全部整数需要考虑 number == Int.min 的情况下无法反转
    ///
    /// - Parameter number: 被反转的整数
    /// - Returns: 反转后的结果
    func reverse(_ number: Int) -> Int {
        var number = number
        var result: Int = 0
        
        repeat {
            result *= 10
            result += number % 10
            number /= 10
        } while number != 0
        
        return result
    }
}

let solution = Solution()

solution.reverse(12221)
solution.reverse(0)
solution.reverse(10)
solution.reverse(100001)
solution.reverse(100)


solution.isPalindrome(12221)
solution.isPalindrome(-12221)
solution.isPalindrome(1222)
solution.isPalindrome(0)
solution.isPalindrome(1221)

