//
//  59. Spiral Matrix II.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/11/24.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class GenerateMatrix {
    func generateMatrix(_ n: Int) -> [[Int]] {
        var matrix = Array(repeating: Array(repeating: 0, count: n), count: n)
        var startI = 0, endI = n - 1, startJ = 0, endJ = n - 1
        var number = 1
        
        while startI <= endI, startJ <= endJ {
            for i in stride(from: startJ, to: endJ + 1, by: 1) {
                matrix[startI][i] = number
                number += 1
            }
            
            for i in stride(from: startI + 1, to: endI + 1, by: 1) {
                matrix[i][endJ] = number
                number += 1
            }
            
            if startI != endI {
                for i in stride(from: endJ - 1, to: startJ - 1, by: -1) {
                    matrix[endI][i] = number
                    number += 1
                }
            }
            
            if startJ != endJ {
                for i in stride(from: endI - 1, to: startI, by: -1) {
                    matrix[i][startJ] = number
                    number += 1
                }
            }
            
            startI += 1
            endI -= 1
            startJ += 1
            endJ -= 1
        }
        
        return matrix
    }
}
