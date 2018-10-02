//
//  221. Maximal Square.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/10/1.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation


class MaximalSquare {
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        guard matrix.count > 0, matrix[0].count > 0 else { return 0 }
        
        var res = Array(repeating: Array(repeating: 0, count: matrix[0].count), count: matrix.count)
        var maxArea = 0
        for i in 0..<matrix.count {
            for j in 0..<matrix[0].count {
                if matrix[i][j] == "0" {
                    continue
                }
                
                if i == 0 || j == 0 {
                    res[i][j] = 1
                }else {
                    if res[i - 1][j] == res[i - 1][j - 1] && res[i - 1][j - 1] == res[i][j - 1] {
                        res[i][j] = res[i - 1][j - 1] + 1
                    }else {
                        res[i][j] = min(min(res[i - 1][j - 1], res[i - 1][j]), res[i][j - 1]) + 1
                    }
                }
                maxArea = max(maxArea, res[i][j])
            }
        }
        return maxArea * maxArea
    }
}
