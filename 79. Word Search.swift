//
//  79. Word Search.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/8.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class Exist {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        guard board.count > 0 && board[0].count > 0 else {
            if word.count == 0 {
                return true
            }else {
                return false
            }
        }
        
        var used = Array(repeating: Array(repeating: false, count: board[0].count), count: board.count)
        
        for i in 0..<board.count {
            for j in 0..<board[0].count {
                if String(board[i][j]) == String(word[word.index(word.startIndex, offsetBy: 0)..<word.index(word.startIndex, offsetBy: 1)]) {
                    let flag = checkExist(index: 0, i: i, j: j, used: &used, word: word, board: board)
                    if flag {
                        return flag
                    }
                }
            }
        }
        return false
    }
    
    
    private func checkExist(index: Int, i: Int, j : Int, used: inout [[Bool]], word: String, board: [[Character]]) -> Bool {
        if index == word.count {
            return true
        }
        
        if i < 0 || i >= board.count || j < 0 || j >= board[0].count {
            return false
        }
        
        if String(word[word.index(word.startIndex, offsetBy: index)..<word.index(word.startIndex, offsetBy: index + 1)]) == String(board[i][j]) && !used[i][j] {
            used[i][j] = true
            if checkExist(index: index + 1, i: i - 1, j: j, used: &used, word: word, board: board) {
                return true
            }
            if checkExist(index: index + 1, i: i + 1, j: j, used: &used, word: word, board: board) {
                return true
            }
            if checkExist(index: index + 1, i: i, j: j - 1, used: &used, word: word, board: board) {
                return true
            }
            if checkExist(index: index + 1, i: i, j: j + 1, used: &used, word: word, board: board) {
                return true
            }
            used[i][j] = false
        }
        return false
    }
}
