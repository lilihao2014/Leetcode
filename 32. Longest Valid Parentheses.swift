//
//  32. Longest Valid Parentheses.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/8/13.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation


class LongestValidParentheses {
    func longestValidParentheses(_ s: String) -> Int {
        guard s.count > 0 else { return 0 }
        
        let charArray = Array(s)
        var res = Array(repeating: 0, count: charArray.count)
        var maxLength = 0
        for i in 1..<res.count {
            if charArray[i] == ")" {
                if charArray[i - 1] == "(" {
                    res[i] = i >= 2 ? res[i - 2] + 2 : 2
                }else if i - res[i - 1] > 0 && charArray[i - res[i - 1] - 1] == "(" {
                    res[i] = res[i - 1] + (i - res[i - 1] >= 2 ? res[i - res[i - 1] - 2] : 0) + 2
                }
                maxLength = max(maxLength, res[i])
            }
        }
        return maxLength
    }
}
