//
//  36. Valid Sudoku.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/10/3.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation


class IsValidSudoku {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        guard board.count == 9, board[0].count == 9 else { return false }
        
        var rowSet = Set<Character>()
        var columnSet = Set<Character>()
        for i in 0..<board.count {
            for j in 0..<board[0].count {
                if board[i][j] != "." {
                    if !rowSet.insert(board[i][j]).inserted { return false }
                }
                
                
                if board[j][i] != "." {
                    if !columnSet.insert(board[j][i]).inserted { return false }
                }
            }
            rowSet.removeAll()
            columnSet.removeAll()
        }
        
        for i in 0..<3 {
            for j in 0..<3 {
                for m in stride(from: i * 3, to: (i + 1) * 3, by: 1) {
                    for n in stride(from: j * 3, to: (j + 1) * 3, by: 1) {
                        guard board[m][n] != "." else { continue }
                        if !rowSet.insert(board[m][n]).inserted { return false }
                    }
                }
                rowSet.removeAll()
            }
        }
        
        return true
    }
}
