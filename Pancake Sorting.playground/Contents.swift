import UIKit

class Solution {
//    func pancakeSort(_ arr: [Int]) -> [Int] {
//        results = [Int]()
//        sort(cakes: arr, n: arr.count)
//        return results
//    }
    
    func pancakeSort(_ arr: [Int]) -> [Int] {
        var newArray = arr
        var flips = [Int]()
        var sortingIndex = newArray.count - 1

        while sortingIndex >= 0{
            if newArray[sortingIndex] != sortingIndex + 1{
                guard let index = newArray.firstIndex(of: sortingIndex + 1) else {break}

                if index != 0{
                    newArray = reverse(newArray, i: 0, j: index)
                    flips.append(index+1)
                }
                newArray = reverse(newArray, i: 0, j: sortingIndex)
                flips.append(sortingIndex + 1)
            }

            sortingIndex -= 1
        }

        return flips
    }
    
    var results = [Int]()
    
    
    func sort(cakes: [Int], n: Int)
    {
        // 最后一张，不需要翻转
        if 1 == n {
            return
        }
        
        // 找最大值
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
        
        // 第二次翻转，将最大的翻到最下面
        temp = reverse(temp, i: 0, j: n - 1)
        results.append(n)
        
        // 递归
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

print(Solution().pancakeSort([3, 2, 4, 1, 6, 5, 7, 10, 8, 9]))
