//
//  73. Set Matrix Zeroes.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/11/24.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class SetZeroes {
    func setZeroes(_ matrix: inout [[Int]]) {
        guard !matrix.isEmpty else { return }
        
        var firstColumnHasZero = false, firstRowHasZero = false
        for i in 0..<matrix.count {
            if matrix[i][0] == 0 {
                firstColumnHasZero = true
                break
            }
        }
        for i in 0..<matrix[0].count {
            if matrix[0][i] == 0 {
                firstRowHasZero = true
                break
            }
        }
        
        for i in 1..<matrix.count {
            for j in 1..<matrix[0].count {
                if matrix[i][j] == 0 {
                    matrix[0][j] = 0
                    matrix[i][0] = 0
                }
            }
        }
        
        for i in 1..<matrix.count {
            for j in 1..<matrix[0].count {
                if matrix[0][j] == 0 {
                    matrix[i][j] = 0
                }else if matrix[i][0] == 0 {
                    matrix[i][j] = 0
                }
            }
        }
        
        if firstColumnHasZero {
            for i in 0..<matrix.count {
                matrix[i][0] = 0
            }
        }
        
        if firstRowHasZero {
            for i in 0..<matrix[0].count {
                matrix[0][i] = 0
            }
        }
    }
}
