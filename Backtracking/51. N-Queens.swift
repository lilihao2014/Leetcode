//
//  51. N-Queens.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/9.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class SolveNQueens {
    func solveNQueens(_ n: Int) -> [[String]] {
        var res = [[String]]()
        var curr = Array(repeating: 0, count: n)
        var usedColumn = Array(repeating: false, count: n)
        var usedDiagonals = Array(repeating: false, count: 2 * n - 1)
        var usedRevDiagonals = Array(repeating: false, count: 2 * n - 1)
        generateNQueens(n: n, row: 0, curr: &curr, res: &res, usedColumns: &usedColumn, usedDiagonals: &usedDiagonals, usedRevDiagonals: &usedRevDiagonals)
        return res
    }
    
    
    private func generateNQueens(n: Int, row: Int, curr: inout [Int], res: inout [[String]], usedColumns: inout [Bool], usedDiagonals: inout [Bool], usedRevDiagonals: inout [Bool]) {
        if n == row {
            res.append(generateList(curr: curr, n: n))
            return
        }
        
        for i in 0..<n {
            if valid(n: n, row: row, column: i, usedColumns: usedColumns, usedDiagonals: usedDiagonals, usedRevDiagonals: usedRevDiagonals) {
                mark(n: n, row: row, column: i, usedColumns: &usedColumns, usedDiagonals: &usedDiagonals, usedRevDiagonals: &usedRevDiagonals)
                curr[row] = i
                generateNQueens(n: n, row: row + 1, curr: &curr, res: &res, usedColumns: &usedColumns, usedDiagonals: &usedDiagonals, usedRevDiagonals: &usedRevDiagonals)
                unMark(n: n, row: row, column: i, usedColumns: &usedColumns, usedDiagonals: &usedDiagonals, usedRevDiagonals: &usedRevDiagonals)
            }
        }
    }
    
    
    private func generateList(curr: [Int], n: Int) -> [String] {
        var res = [String]()
        for num in curr {
            var defaultArray = Array(repeating: ".", count: n)
            defaultArray[num] = "Q"
            var qString = String()
            defaultArray.forEach { (str) in
                qString += str
            }
            res.append(qString)
        }
        return res
    }
    
    
    private func unMark(n: Int, row: Int, column: Int, usedColumns: inout [Bool], usedDiagonals: inout [Bool], usedRevDiagonals: inout [Bool]) {
        usedColumns[column] = false
        usedDiagonals[column + row] = false
        usedRevDiagonals[column - row + n - 1] = false
    }
    
    
    private func mark(n: Int, row: Int, column: Int, usedColumns: inout [Bool], usedDiagonals: inout [Bool], usedRevDiagonals: inout [Bool]) {
        usedColumns[column] = true
        usedDiagonals[row + column] = true
        usedRevDiagonals[column - row + n - 1] = true
    }
    
    
    private func valid(n: Int, row: Int, column: Int, usedColumns: [Bool], usedDiagonals: [Bool], usedRevDiagonals: [Bool]) -> Bool {
        return !usedColumns[column] && !usedDiagonals[column + row] && !usedRevDiagonals[column - row + n - 1]
    }
}
