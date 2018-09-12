//
//  Laicode Longest Common Subsequence.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/11.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class LongestSubsequence {
    func longest(s: String, t: String) -> Int {
        let sArray = Array(s)
        let tArray = Array(t)
        
        var res = Array(repeating: Array(repeating: 0, count: tArray.count + 1), count: sArray.count + 1)
        
        for i in 1..<sArray.count + 1 {
            for j in 1..<tArray.count + 1 {
                if sArray[i - 1] == tArray[j - 1] {
                    res[i][j] = res[i - 1][j - 1] + 1
                }else {
                    res[i][j] = max(res[i - 1][j], res[i][j - 1])
                }
            }
        }
        
        return res[res.count - 1][res[0].count - 1]
    }
}
