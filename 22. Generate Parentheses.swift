//
//  22. Generate Parentheses.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/22.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class GenerateParenthesis {
    func generateParenthesis(_ n: Int) -> [String] {
        var tmp = String()
        var res = [String]()
        helper(&res, &tmp, n, n)
        return res
    }
    
    
    private func helper(_ res: inout [String], _ tmp: inout String, _ left: Int, _ right: Int) {
        if left == 0 && right == 0 {
            res.append(tmp)
            return
        }
        if left > 0 {
            tmp += "("
            helper(&res, &tmp, left - 1, right)
            tmp.removeLast()
        }
        if right > left {
            tmp += ")"
            helper(&res, &tmp, left, right - 1)
            tmp.removeLast()
        }
    }
}
