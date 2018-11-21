//
//  48. Rotate Image.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/11/20.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class RotateMatrix {
    func rotate(_ matrix: inout [[Int]]) {
        let n = matrix.count - 1
        var row = 0
        while row <= n / 2 {
            for i in row..<n - row {
                let tmp = matrix[i][row]
                matrix[i][row] = matrix[n - row][i]
                matrix[n - row][i] = matrix[n - i][n - row]
                matrix[n - i][n - row] = matrix[row][n - i]
                matrix[row][n - i] = tmp
            }
            row += 1
        }
    }
}
