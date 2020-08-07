import UIKit

class Solution {
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        if s.count == 0 {
            return []
        }
        
        let sourceCharArray = Array(s)
        
        var need = [Character: Int]()
        var window = [Character: Int]()
        
        var result = [Int]()
        
        for char in p {
            if let temp = need[char] {
                need[char] = temp + 1
            } else {
                need[char] = 1
            }
        }
        
        var left = 0
        var valid = 0
        var right = 0
        
        let needKeys = need.keys
        
        for char in s {
            right += 1
            
            if needKeys.contains(char) {
                if let temp = window[char] {
                    window[char] = temp + 1
                } else {
                    window[char] = 1
                }
                
                if window[char] == need[char] {
                    valid += 1
                }
            }
            
            while right - left >= p.count {
                if valid == need.count {
                    result.append(left)
                }
                
                let charToDelete = sourceCharArray[left]
                left += 1
                
                if needKeys.contains(charToDelete) {
                    if window[charToDelete] == need[charToDelete] {
                        valid -= 1
                    }
                    if let temp = window[charToDelete] {
                        window[charToDelete] = temp - 1
                    } else {
                        window[charToDelete] = -1
                    }
                }
            }
        }
        
        return result
    }
}

Solution().findAnagrams("abab", "ab")
