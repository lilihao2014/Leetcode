//
//  115. Distinct Subsequences.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/8/11.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class NumDistinct {
    func numDistinct(_ s: String, _ t: String) -> Int {
        guard  s.count != 0 && t.count != 0 else {
            return 0
        }
        var res = Array(repeating: Array(repeating: 0, count: t.count + 1), count: s.count + 1)
        for i in 0..<res.count {
            res[i][0] = 1
        }
        let sCharArray = Array(s)
        let tCharArray = Array(t)
        for i in 1..<res.count {
            for j in 1..<res[0].count {
                if sCharArray[i - 1] == tCharArray[j - 1] {
                    res[i][j] = res[i - 1][j - 1] + res[i - 1][j]
                }else {
                    res[i][j] = res[i - 1][j]
                }
            }
        }
        return res[s.count][t.count]
    }
}
