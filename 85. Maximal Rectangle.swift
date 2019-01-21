//
//  85. Maximal Rectangle.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2019/1/21.
//  Copyright © 2019 Lihao Li. All rights reserved.
//

import Foundation


class MaximalRectangle {
    
    func maximalRectangle(_ matrix: [[Character]]) -> Int {
        guard !matrix.isEmpty else { return 0 }
        
        let m = matrix.count, n = matrix[0].count
        var leftArray = [Int](repeating: Int.min, count: n), rightArray = [Int](repeating: Int.max, count: n), heightArray = [Int](repeating: 0, count: n)
        var maxArea = 0
        
        for i in 0..<m {
            var rB = n - 1
            for j in (0..<n).reversed() {
                if matrix[i][j] == "1" {
                    rightArray[j] = min(rightArray[j], rB)
                }else {
                    rightArray[j] = n - 1
                    rB = j - 1
                }
            }
            
            var lB = 0
            for j in 0..<n {
                if matrix[i][j] == "1" {
                    leftArray[j] = max(leftArray[j], lB)
                    heightArray[j] += 1
                    maxArea = max(maxArea, heightArray[j] * (rightArray[j] - leftArray[j] + 1))
                }else {
                    heightArray[j] = 0
                    leftArray[j] = 0
                    lB = j + 1
                }
            }
        }
        
        return maxArea
    }
    
}
