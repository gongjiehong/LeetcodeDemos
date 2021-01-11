import UIKit

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var result = 0
        if nums.count == 0 {
            return result
        }
        var new = nums
        for index in 1..<nums.count {
            if nums[index] != new[result] {
                result += 1
            } else {
                new.remove(at: result)
            }
        }
        nums = new
        return result + 1
    }
}


var nums: [Int] = []
Solution().removeDuplicates(&nums)
print(nums)
