//
//  62. Unique Paths.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/8/9.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

class UniquePaths {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        guard m > 0, n > 0 else { return 0 }
        var res = Array(repeating: Array(repeating: 0, count: m), count: n)
        for i in 0..<res.count {
            for j in 0..<res[0].count {
                if i == 0 || j == 0{
                    res[i][j] = 1
                }else {
                    res[i][j] = res[i - 1][j] + res[i][j - 1]
                }
            }
        }
        return res[res.count - 1][res[0].count - 1]
    }
}
