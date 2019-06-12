import UIKit

class Solution {
    func reverse(_ number: Int) -> Int {
        var numberForCalc = number
        var result: Int = 0
        
        repeat {
            var delta = numberForCalc % 10
            numberForCalc /= 10
            
            
            /// 上溢出，去除个位已经大于或者个位大于7 (2147483647)
            if result > Int32.max / 10 || (result == Int32.max / 10 && delta > 7) {
                return 0
            }
            
            /// 下溢出，去除个位已经小于或者个位小于-8 (-2147483648)
            if (result < Int32.min / 10 || (result == Int32.min / 10 && delta < -8)) {
                return 0
            }
            
            result *= 10
            result += delta
            
            
        } while numberForCalc != 0
        
        return result
    }
}

let solution = Solution()

solution.reverse(-10086)
solution.reverse(10086)
solution.reverse(-1563847413)
solution.reverse(-2147483412)
solution.reverse(120)

Int32.max
Int32.min
Int.max
Int.min
