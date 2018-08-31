//
//  Laicode Longest Consecutive 1s.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/8/30.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class LongestConsecutive1S {
    func longest(array: [Int]) -> Int {
        var res = 0, curr = 0
        for i in 0..<array.count {
            if array[i] == 1 {
                if i == 0 || array[i - 1] == 0 {
                    curr = 1
                }else {
                    curr += 1
                }
                res = max(res, curr)
            }
        }
        return res
    }
}
