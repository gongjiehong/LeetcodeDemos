import UIKit

class Solution {
    func myAtoi(_ s: String) -> Int {
        // 拿掉前后空格
        let stringToCALC = s.trimmingCharacters(in: CharacterSet.whitespaces)
        let plus = Character("+")
        let minus = Character("-")
        
        
        // 用于判断溢出2147483647
        let maxIntengerComponent: Int = Int(Int32.max / 10 + 7)

        
        var result = 0
        var addedValidElement = false
        var negative = false
        
        for char in stringToCALC {
            // 处理数字
            if let asciiValue = char.asciiValue, asciiValue > 47 && asciiValue < 58  {
                // 通过asiic码计算是数字的值
                let number = Int(asciiValue - 48)
                // 正数上溢出，2147483647
                if !negative && result > maxIntengerComponent - number {
                    return Int(Int32.max)
                }
                // 负数下溢出，-2147483648 不带符号，再加一
                else if negative && result > maxIntengerComponent - number + 1 {
                    return Int(Int32.min)
                }
                
                result = 10 * result + number
                addedValidElement = true
            }
            // 处理负符号，有多个符号了直接不处理
            else if !addedValidElement && char == minus {
                negative = true
                addedValidElement = true
            }
            // 处理正符号，有多个符号了直接不处理
            else if !addedValidElement && char == plus {
                addedValidElement = true
            } else {
                break
            }
        }
        
        return negative ? -result : result
    }
}
//9223372036854775807
//20000000000000000000
Solution().myAtoi("-00001234567")
