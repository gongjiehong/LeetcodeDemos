import UIKit

class Solution {
    func decompressRLElist(_ nums: [Int]) -> [Int] {
        var newNums = nums
        var result = [Int]()
            
        while newNums.count > 1 {
            let first = newNums.removeFirst()
            let second = newNums.removeFirst()
            let newArray = [Int](repeating: second, count: first)
            result += newArray
        }
        
        return result
    }
}


Solution().decompressRLElist([1, 1, 2, 3])
