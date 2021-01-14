import UIKit

class Solution {
    func maximum69Number (_ num: Int) -> Int {
        var newNum = num
        var numArray = [Int]()
        
        // 先把数字转成每一位的数组
        while newNum != 0 {
            numArray.insert(newNum % 10, at: 0)
            newNum /= 10
        }
        
        // 找到第一个6翻转成9
        for (index, temp) in numArray.enumerated() {
            if temp == 6 {
                numArray[index] = 9
                break
            }
        }
        
        // 再把数组转回整数
        var result = 0
        for temp in numArray {
            result = result * 10 + temp
        }
        
        return result
    }
}

Solution().maximum69Number(9969)
