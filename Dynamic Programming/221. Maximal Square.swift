//
//  221. Maximal Square.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/8/11.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class MaximalSquare {
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        guard matrix.count > 0 && matrix[0].count > 0 else {
            return 0
        }
        var maxArea = 0
        var res = Array(repeating: Array(repeating: 0, count: matrix[0].count), count: matrix.count)
        
        for i in 0..<res.count {
            res[i][0] = matrix[i][0] == "0" ? 0 : 1
            maxArea = max(maxArea, res[i][0])
        }
        
        for i in 0..<res[0].count {
            res[0][i] = matrix[0][i] == "0" ? 0 : 1
            maxArea = max(maxArea, res[0][i])
        }
        
        for i in 1..<res.count {
            for j in 1..<res[0].count {
                if matrix[i][j] == "0" {
                    res[i][j] = 0
                    continue
                }
                
                if res[i - 1][j] == 0 || res[i - 1][j - 1] == 0 || res[i][j - 1] == 0 {
                    res[i][j] = 1
                }else if res[i - 1][j] == res[i - 1][j - 1] && res[i - 1][j - 1] == res[i][j - 1] {
                    res[i][j] = res[i - 1][j - 1] + 1
                }else {
                    res[i][j] = min(min(res[i - 1][j - 1], res[i - 1][j]), res[i][j - 1]) + 1
                }
                maxArea = max(res[i][j], maxArea)
            }
        }
        return maxArea * maxArea
    }
}
