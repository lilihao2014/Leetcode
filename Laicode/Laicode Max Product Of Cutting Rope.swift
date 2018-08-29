//
//  Laicode Max Product Of Cutting Rope.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/8/28.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class MaxProductOfCuttingRope {
    func maxProductOfCuttingRope(length: Int) -> Int {
        var res = [Int](repeating: 0, count: length + 1)
        res[1] = 0
        res[2] = 1
        
        for i in 3..<res.count {
            for j in 1...i / 2 {
                res[i] = max(res[i], j * max(i - j, res[i - j]))
            }
        }
        
        return res[res.count - 1]
    }
}
