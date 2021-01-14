import UIKit

class Solution {
    func pancakeSort(_ arr: [Int]) -> [Int] {
        results = [Int]()
        sort(cakes: arr, n: arr.count)
        return results
    }
    
    var results = [Int]()
    
    func sort(cakes: [Int], n: Int)
    {
        // 最后一张，不需要翻转
        if 1 == n {
            return
        }
        
        // 找最大的饼和索引
        var maxCake: Int = 0
        var maxCakeIndex: Int = 0
        for j in 0..<n {
            if cakes[j] > maxCake {
                maxCake = cakes[j]
                maxCakeIndex = j
            }
        }
        
        // 第一次翻转，将最大的翻到最上面
        var temp = reverse(cakes, i: 0, j: maxCakeIndex)
        results.append(maxCakeIndex + 1)
        

        // 第二次翻转，将最大的翻到最下面，全部翻个面
        temp = reverse(temp, i: 0, j: n - 1)
        results.append(n)
                
        // 递归，缩小范围，底部那张已经是最大了，不再参与翻转
        sort(cakes: temp, n: n - 1)
        
    }
    
    func reverse(_ array: [Int], i: Int, j: Int) -> [Int]
    {
        var start = i
        var end = j
        var newArray = array
        while start < end {
            newArray.swapAt(start, end)
            start += 1
            end -= 1
        }
        return newArray
    }
}

print(Solution().pancakeSort([3, 2, 4, 1,5,6,7,9,8,10,15,13,14,12,15,15,15,14]))

// [11, 17, 1, 16, 14, 15, 14, 14, 12, 13, 12, 12, 1, 11, 10, 10, 8, 9, 1, 8, 1, 7, 6, 6, 5, 5, 3, 4, 2, 3, 1, 2]
// [11, 17, 2, 13, 11, 12, 1, 11, 10, 10, 8, 9, 1, 8, 1, 7, 6, 6, 5, 5, 3, 4, 2, 3, 1, 2]
// [11, 18, 2, 13, 11, 12, 1, 11, 10, 10, 8, 9, 1, 8, 1, 7, 6, 6, 5, 5, 3, 4, 2, 3, 1, 2]

[11, 18, 2, 17, 14, 16, 2, 15, 2, 14, 1, 13, 2, 12, 11, 11, 1, 10, 8, 9, 1, 8, 1, 7, 6, 6, 5, 5, 3, 4, 2, 3, 1, 2]
