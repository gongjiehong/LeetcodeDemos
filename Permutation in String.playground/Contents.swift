import UIKit

/*
 滑动窗口算法框架
 /* 滑动窗口算法框架 */
void slidingWindow(string s, string t) {
    unordered_map<char, int> need, window;
    for (char c : t) need[c]++;
    
    int left = 0, right = 0;
    int valid = 0;
    while (right < s.size()) {
        // c 是将移入窗口的字符
        char c = s[right];
        // 右移窗口
        right++;
        // 进行窗口内数据的一系列更新
        ...
            
            /*** debug 输出的位置 ***/
            printf("window: [%d, %d)\n", left, right);
        /********************/
        
        // 判断左侧窗口是否要收缩
        while (window needs shrink) {
            // d 是将移出窗口的字符
            char d = s[left];
            // 左移窗口
            left++;
            // 进行窗口内数据的一系列更新
            ...
        }
    }
}
*/

class Solution {
    func checkInclusion(_ target: String, _ source: String) -> Bool {
        let sourceCharArray = Array(source)
        var need = [Character: Int]()
        var window = [Character: Int]()
        
        // 组装需要的字符hash表，记录字符各需要多少个
        for tempChar in target {
            if let tmpCount = need[tempChar] {
                need[tempChar] = tmpCount + 1
            } else {
                need[tempChar] = 1
            }
        }
        
        // 
        var left = 0
        var valid = 0
        
        let needKeys = need.keys
        
        for right in 1...sourceCharArray.count {
            let char = sourceCharArray[right - 1]
            
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
            
            print("left = \(left), right = \(right)")
            print("valid = \(valid), target.count = \(target.count)")
            
            while right - left >= target.count {
                if valid == need.count {
                    return true
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
        
        return false
    }
}

Solution().checkInclusion("abcdxabcde", "abcdeabcdx")
