//
//  Laicode All Valid Permutations Of Parentheses I.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/6.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class ValidParentheses {
    func validParentheses(n: Int) -> [String] {
        var curr = String()
        var res = [String]()
        generateParentheses(left: n, right: n, curr: &curr, res: &res)
        return res
    }
    
    private func generateParentheses(left: Int, right: Int, curr: inout String, res: inout [String]) {
        if left == 0 && right == 0 {
            res.append(curr)
            return
        }
        
        if left > 0 {
            curr.append("(")
            generateParentheses(left: left - 1, right: right, curr: &curr, res: &res)
            curr.removeLast()
        }
        
        if right > left {
            curr.append(")")
            generateParentheses(left: left, right: right - 1, curr: &curr, res: &res)
            curr.removeLast()
        }
    }
}
