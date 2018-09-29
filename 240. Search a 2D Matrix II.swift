//
//  240. Search a 2D Matrix II.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/28.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation


class SearchMatrix {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        guard matrix.count > 0, matrix[0].count > 0 else { return false }
        var i = matrix.count - 1, j = 0
        
        while i >= 0 && j < matrix[0].count {
            if matrix[i][j] == target {
                return true
            }else if matrix[i][j] < target {
                j += 1
            }else {
                i -= 1
            }
        }
        
        return false
    }
}
