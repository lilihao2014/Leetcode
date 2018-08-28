//
//  Laicode N Queens.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/8/28.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class NQueens {
    func nqueens(n: Int) -> [[Int]] {
        var res = [[Int]]()
        var curr = [Int](repeating: 0, count: n)
        var usedColumns = [Bool](repeating: false, count: n)
        var usedDiagonals = [Bool](repeating: false, count: 2 * n - 1)
        var usedRevDiagonals = [Bool](repeating: false, count: 2 * n - 1)
        helper(n: n, row: 0, curr: &curr, res: &res, usedColumn: &usedColumns, usedDiagonals: &usedDiagonals, usedRevDiagonals: &usedRevDiagonals)
        return res
    }
    
    
    private func helper(n: Int, row: Int, curr: inout [Int], res: inout [[Int]], usedColumn: inout [Bool], usedDiagonals: inout [Bool], usedRevDiagonals: inout [Bool]) {
        if n == row {
            res.append(curr)
            return
        }
        
        for i in 0..<n {
            if isValid(n: n, column: i, row: row, usedColumn: usedColumn, usedDiagonals: usedDiagonals, usedRevDiagonals: usedRevDiagonals) {
                mark(n: n, column: i, row: row, usedColumn: &usedColumn, usedDiagonals: &usedDiagonals, usedRevDiagonals: &usedRevDiagonals)
                curr[row] = i
                helper(n: n, row: row + 1, curr: &curr, res: &res, usedColumn: &usedColumn, usedDiagonals: &usedDiagonals, usedRevDiagonals: &usedRevDiagonals)
                unMark(n: n, column: i, row: row, usedColumn: &usedColumn, usedDiagonals: &usedDiagonals, usedRevDiagonals: &usedRevDiagonals)
            }
        }
    }
    
    
    private func mark(n: Int, column: Int, row: Int, usedColumn: inout [Bool], usedDiagonals: inout [Bool], usedRevDiagonals: inout [Bool]) {
        usedColumn[column] = true
        usedDiagonals[column + row] = true
        usedRevDiagonals[column - row + n - 1] = true
    }
    
    
    private func unMark(n: Int, column: Int, row: Int, usedColumn: inout [Bool], usedDiagonals: inout [Bool], usedRevDiagonals: inout [Bool]) {
        usedColumn[column] = false
        usedDiagonals[column + row] = false
        usedRevDiagonals[column - row + n - 1] = false
    }
    
    
    private func isValid(n: Int, column: Int, row: Int, usedColumn: [Bool], usedDiagonals: [Bool], usedRevDiagonals: [Bool]) -> Bool {
        return !usedColumn[column] && !usedDiagonals[column + row] && !usedRevDiagonals[column - row + n - 1]
    }
}
