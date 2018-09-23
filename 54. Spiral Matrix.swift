//
//  54. Spiral Matrix.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/22.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class SpiralOrder {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var res = [Int]()
        guard matrix.count > 0, matrix[0].count > 0 else { return res }
        var startI = 0, endI  = matrix.count - 1
        var startJ = 0, endJ = matrix[0].count - 1
        while endI >= startI && endJ >= startJ {
            for i in stride(from: startJ, to: endJ + 1, by: 1) {
                res.append(matrix[startI][i])
            }
            for i in stride(from: startI + 1, to: endI + 1, by: 1) {
                res.append(matrix[i][endJ])
            }
            if startI != endI {
                for i in stride(from: endJ - 1, to: startJ - 1, by: -1) {
                    res.append(matrix[endI][i])
                }
            }
            if startJ != endJ {
                for i in stride(from: endI - 1, to: startI, by: -1) {
                    res.append(matrix[i][startJ])
                }
            }
            startI += 1
            endI -= 1
            startJ += 1
            endJ -= 1
        }
        return res
    }
}
