//
//  64. Minimum Path Sum.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/8/9.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

class MinPathSum {
    func minPathSum(_ grid: [[Int]]) -> Int {
        var arrayCopy = grid
        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                if i == 0 && j == 0 {
                    continue
                }else if i == 0 {
                    arrayCopy[i][j] = arrayCopy[i][j - 1] + arrayCopy[i][j]
                }else if j == 0 {
                    arrayCopy[i][j] = arrayCopy[i - 1][j] + arrayCopy[i][j]
                }else {
                    arrayCopy[i][j] = min(arrayCopy[i - 1][j], arrayCopy[i][j - 1]) + arrayCopy[i][j]
                }
            }
        }
        return arrayCopy[arrayCopy.count - 1][arrayCopy[0].count - 1]
    }
}
