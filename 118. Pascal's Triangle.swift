//
//  118. Pascal's Triangle.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/10/12.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation


class Generate {
    func generate(_ numRows: Int) -> [[Int]] {
        var res = [[Int]]()
        var prev = [Int]()
        for i in 0..<numRows {
            var tmp = [Int]()
            tmp.append(1)
            if i > 1 {
                for j in 1..<i {
                    tmp.append(prev[j - 1] + prev[j])
                }
            }
            if i != 0 {
                tmp.append(1)
            }
            res.append(tmp)
            prev = tmp
        }
        return res
    }
}
