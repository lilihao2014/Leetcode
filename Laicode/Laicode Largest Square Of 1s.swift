//
//  Laicode Largest Square Of 1s.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/8/28.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class Largest {
    func largest(matrix: [[Int]]) -> Int {
        guard matrix.count > 0 && matrix[0].count > 0 else {
            return 0
        }
        var res = 0
        var lengthArray = Array(repeating: Array(repeating: 0, count: matrix[0].count), count: matrix.count)
        
        for i in 0..<matrix.count {
            for j in 0..<matrix[0].count {
                if i == 0 || j == 0 {
                    lengthArray[i][j] = matrix[i][j] == 0 ? 0 : 1
                }else if matrix[i][j] == 1 {
                    lengthArray[i][j] = min(lengthArray[i - 1][j], min(lengthArray[i - 1][j - 1], lengthArray[i][j - 1])) + 1
                }
                res = max(res, lengthArray[i][j])
            }
        }
        return res
    }
}
