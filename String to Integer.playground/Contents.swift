import UIKit

class Solution {
    func myAtoi(_ s: String) -> Int {
        let stringToCALC = s.trimmingCharacters(in: CharacterSet.whitespaces)
        let plus = Character("+")
        let minus = Character("-")
        
        let maxIntengerComponent = 214748371
        
        var result = 0
        var addedValidElement = false
        var negative = false
        
        for char in stringToCALC {
            if let asciiValue = char.asciiValue, asciiValue > 47 && asciiValue < 58  {
                // 通过asiic码计算是数字的值
                let number = Int(asciiValue - 48)
                if !negative && result > maxIntengerComponent - number {
                    return Int(Int32.max)
                } else if negative && result > maxIntengerComponent - number + 1 {
                    return Int(Int32.min)
                }
                
                result = 10 * result + number
                addedValidElement = true
            } else if !addedValidElement && char == minus {
                negative = true
                addedValidElement = true
            } else if !addedValidElement && char == plus {
                addedValidElement = true
            } else {
                break
            }
        }
        
        if negative {
            return 0 - result
        } else {
            return result
        }
    }
}
//9223372036854775807
//20000000000000000000
//Solution().myAtoi()
print(Int("-00001234567") ?? Int32.min)
