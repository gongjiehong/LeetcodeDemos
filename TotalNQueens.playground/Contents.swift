import UIKit

class Solution {
    // 存储结果
    var results = [[String]]()
    
    func totalNQueens(_ n: Int) -> Int {
        // 初始棋盘，全是黑点
        let board = [[String]](repeating: [String](repeating: ".", count: n), count: n)
        // 从第一行开始写入
        backtrack(board, row: 0)
        return results.count
    }
    
    func backtrack(_ board: [[String]], row: Int) {
        var board = board
        // 如果行数够了结束
        if board.count == row {
            var result = [String]()
            for temp in board {
                result.append(temp.joined())
            }
            if !results.contains(result) {
                results.append(result)
            }
            return
        }
        
        // 某一行字符长度
        for column in 0..<board.count {
            if !isValid(board, row: row, column: column) {
                continue
            }
            
            // 现在这一行做选择，写入Q
            board[row][column] = "Q"
            // 进入下一行决策
            backtrack(board, row: row + 1)
            // 取消选择，回溯
            board[row][column] = "."
        }
    }
    
    func isValid(_ board: [[String]], row: Int, column: Int) -> Bool {
        let size = board.count
        
        // 当前列如果有了，返回fasle
        for temp in 0..<size {
            if board[temp][column] == "Q" {
                return false
            }
        }
        
        var i = row - 1 // 当前上面所有的行
        var j = column + 1 // 右边的列
        
        // 检查右上角斜线是否有皇后互相冲突
        while i >= 0 && j < size {
            
            if board[i][j] == "Q" {
                return false
            }
            i -= 1
            j += 1
        }
        
        i = row - 1 // 当前上面所有的行
        j = column - 1 // 左边的列
        
        // 检查左上角斜线是否有皇后互相冲突
        while j >= 0 && i >= 0 {
            if board[i][j] == "Q" {
                return false
            }
            i -= 1
            j -= 1
        }
        
        return true
    }
}

print(Solution().totalNQueens(5))
