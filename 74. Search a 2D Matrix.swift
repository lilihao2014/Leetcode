//
//  74. Search a 2D Matrix.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/11/24.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class SearchMatrixI {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        guard !matrix.isEmpty else { return false }
        
        var i = matrix.count - 1, j = 0
        while i >= 0 && j < matrix[0].count {
            if target == matrix[i][j] {
                return true
            }else if target < matrix[i][j] {
                i -= 1
            }else {
                j += 1
            }
        }
        
        return false
    }
}
