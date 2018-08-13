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
        guard s.count > 1 else {
            return 0
        }
        let sCharArray = Array(s)
        var res = [Int](repeating: 0, count: sCharArray.count)
        var maxLength = 0
        for i in 1..<sCharArray.count {
            if sCharArray[i] == ")" {
                if sCharArray[i - 1] == "("  {
                    res[i] = (i >= 2 ? res[i - 2] : 0) + 2
                }else if (i - res[i - 1] > 0) && (sCharArray[i - res[i - 1] - 1] == "(") {
                    res[i] = res[i - 1] + (i - res[i - 1] >= 2 ? res[i - res[i - 1] - 2] : 0) + 2
                }
                maxLength = max(maxLength, res[i])
            }
        }
        return maxLength
    }
}
