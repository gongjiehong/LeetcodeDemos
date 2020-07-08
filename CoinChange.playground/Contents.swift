import UIKit

func coinChange(coins: [Int], amount: Int) -> Int {
    // amount 可能为0，所以在都为1毛的情况下结果为amount，所以初始值设置amount + 1，数组也多加一个元素，存储0
    var resultArray = [Int](repeating: amount + 1, count: amount + 1)
    // amount为0只需要0个
    resultArray[0] = 0
    // 外层循环计算第amount
    for i in 0..<resultArray.count {
        // 内层循环金币数额
        for coin in coins {
            // 如果当前数量小于金币值，跳过不做计算
            if (i - coin < 0) { continue }
            // 现有记录[当前数额 - 金币数量)] + 一个当前面值是否小于已有记录
            resultArray[i] = min(resultArray[i], resultArray[i - coin] + 1)
        }
    }
    
    // 未找到解
    if resultArray[amount] == amount + 1 {
        return -1
    } else {
        return resultArray[amount]
    }
}

coinChange(coins: [1, 2, 5], amount: 1002)
