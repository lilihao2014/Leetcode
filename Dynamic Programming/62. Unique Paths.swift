//
//  62. Unique Paths.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/8/9.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

class UniquePaths {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var res = Array(repeating: Array(repeating: 0, count: n), count: m)
        
        for i in 0..<m {
            res[i][0] = 1
        }
        
        for i in 0..<n {
            res[0][i] = 1
        }
        
        for i in 1..<m {
            for j in 1..<n {
                res[i][j] = res[i - 1][j] + res[i][j - 1]
            }
        }
        return res[m - 1][n - 1]
    }
}
