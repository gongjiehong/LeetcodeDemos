import UIKit

class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var newArray = nums1 + nums2
        newArray = newArray.sorted()
        let count = newArray.count
        if count == 1 {
            return Double(newArray[0]) / 1.0
        } else if count % 2 == 0 {
            return (Double(newArray[count / 2 - 1]) + Double(newArray[count / 2])) / 2.0
        } else {
            return Double(newArray[count / 2]) / 1.0
        }
    }
}

Solution().findMedianSortedArrays([1,2], [3,4])
