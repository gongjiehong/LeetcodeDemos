import UIKit


class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var minValue = prices.first ?? 0
        var maxValue = 0
        
        for (index, value) in prices.enumerated() {
            minValue = min(minValue, value)
            if value > minValue {
                maxValue = max(maxValue, value)

                if index < prices.count - 1 {
                    maxValue = max(maxValue, prices[index + 1])
                } else {
                    maxValue = max(maxValue, value)
                }
            }
        }
        return max(0, maxValue - minValue)
    }
}

Solution().maxProfit([2,4,1])
