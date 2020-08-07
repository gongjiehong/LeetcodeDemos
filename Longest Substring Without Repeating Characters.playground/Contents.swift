import UIKit

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        if s.count == 0 {
            return 0
        }
        
        let sourceCharArray = Array(s)
        var window = [Character: Int]()
        var left = 0
        var right = 0
        var result = 0
        
        for char in sourceCharArray {
            right += 1
            if let temp = window[char] {
                window[char] = temp + 1
            } else {
                window[char] = 1
            }
            
            while let temp = window[char], temp > 1 {
                let charToDelete = sourceCharArray[left]
                left += 1
                
                if let tmp = window[charToDelete] {
                    window[charToDelete] = tmp - 1
                } else {
                    window[charToDelete] = -1
                }
            }
            
            result = max(result, right - left)

        }
        return result
    }
}

Solution().lengthOfLongestSubstring("tmmzuxt")
