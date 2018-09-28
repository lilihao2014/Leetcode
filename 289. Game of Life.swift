//
//  289. Game of Life.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/28.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class GameOfLife {
    func gameOfLife(_ board: inout [[Int]]) {
        guard board.count > 0 && board[0].count > 0 else { return }
        let originalBoard = board
        for i in 0..<board.count {
            for j in 0..<board[0].count {
                board[i][j] = checkLiveInNextGeneration(originalBoard, i: i, j: j)
            }
        }
    }
    
    private let directionColumn = [-1, 0, 1, -1, 1, -1, 0, 1]
    private let directionRow =    [-1, -1, -1, 0, 0, 1, 1, 1]
    
    private func checkLiveInNextGeneration(_ board: [[Int]], i: Int, j: Int) -> Int {
        if board[i][j] == 0 {
            var liveCount = 0
            for index in 0..<directionColumn.count {
                let currentColumn = directionColumn[index] + j
                let currrentRow = directionRow[index] + i
                if currentColumn < 0 || currentColumn >= board[0].count || currrentRow < 0 || currrentRow >= board.count { continue }
                if board[currrentRow][currentColumn] == 1 { liveCount += 1}
                if liveCount > 3 {
                    return 0
                }
            }
            if liveCount == 3 { return 1}
            else { return 0 }
        }else {
            var liveCount = 0
            for index in 0..<directionColumn.count {
                let currentColumn = directionColumn[index] + j
                let currrentRow = directionRow[index] + i
                if currentColumn < 0 || currentColumn >= board[0].count || currrentRow < 0 || currrentRow >= board.count { continue }
                if board[currrentRow][currentColumn] == 1 { liveCount += 1}
                if liveCount > 3 {
                    return 0
                }
            }
            if liveCount < 2 || liveCount > 3 { return 0 }
            else { return 1 }
        }
    }
}
