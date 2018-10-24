//
//  63. Unique Paths II.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/10/23.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation


class UniquePathsWithObstacles {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        guard obstacleGrid.count > 0, obstacleGrid[0].count > 0 else { return 0 }
        
        var res = Array(repeating: Array(repeating: 0, count: obstacleGrid[0].count), count: obstacleGrid.count)
        
        for j in 0..<res[0].count {
            if obstacleGrid[0][j] != 1 {
                res[0][j] = 1
            }else {
                break
            }
        }
        
        for i in 0..<res.count {
            if obstacleGrid[i][0] != 1 {
                res[i][0] = 1
            }else {
                break
            }
        }
        
        for i in 1..<res.count {
            for j in 1..<res[0].count {
                if obstacleGrid[i][j] == 1 {
                    res[i][j] = 0
                }else {
                    res[i][j] = res[i - 1][j] + res[i][j - 1]
                }
            }
        }
        
        return res[res.count - 1][res[0].count - 1]
    }
}
