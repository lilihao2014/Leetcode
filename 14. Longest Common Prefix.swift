//
//  14. Longest Common Prefix.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/18.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class LongestCommonPrefix {
    func longestCommonPrefix(_ strs: [String]) -> String {
        var res = String()
        guard strs.count > 0 else { return res }
        for i in 0..<strs[0].count {
            for j in 1..<strs.count {
                if i == strs[j].count || strs[0][strs[0].index(strs[0].startIndex, offsetBy: i)] != strs[j][strs[j].index(strs[j].startIndex, offsetBy: i)] {
                    return res
                }
            }
            res.append(strs[0][strs[0].index(strs[0].startIndex, offsetBy: i)])
        }
        return res
    }
}
