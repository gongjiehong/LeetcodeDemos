import UIKit

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var numsDictionary = [Int: Int]()
        for (index, number) in nums.enumerated() {
            let complement = target - number
            if numsDictionary.keys.contains(complement) {
                return [numsDictionary[complement]!, index]
            } else {
                numsDictionary[number] = index
            }
        }
        
        fatalError("Can not found two value sum = \(target)")
    }
    
    init() {
        
    }
}

let solution = Solution()

solution.twoSum([2, 7, 11, 15], 9)
solution.twoSum([3, 2, 4], 6)
