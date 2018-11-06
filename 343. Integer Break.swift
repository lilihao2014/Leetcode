//
//  343. Integer Break.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/2.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class IntegerBreak {
    func integerBreak(_ n: Int) -> Int {
        var res = [Int](repeating: 0, count: n + 1)
        res[1] = 0
        res[2] = 1
        for i in 3..<res.count {
            for j in 1...i/2 {
                res[i] = max(res[i], j * max(i - j, res[i - j]))
            }
        }
        return res[res.count - 1]
    }
}
