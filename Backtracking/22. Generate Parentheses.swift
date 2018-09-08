//
//  22. Generate Parentheses.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/8.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class GenerateParenthesis {
    func generateParenthesis(_ n: Int) -> [String] {
        var res = [String]()
        var tmp = String()
        generatePatenthesis(left: n, right: n, tmp: &tmp, res: &res)
        return res
    }
    
    
    private func generatePatenthesis(left: Int, right: Int, tmp: inout String, res: inout [String]) {
        if left == 0 && right == 0 {
            res.append(tmp)
            return
        }
        
        if left  > 0 {
            tmp.append(String("("))
            generatePatenthesis(left: left - 1, right: right, tmp: &tmp, res: &res)
            tmp.removeLast()
        }
        
        if right > left {
            tmp.append(String(")"))
            generatePatenthesis(left: left, right: right - 1, tmp: &tmp, res: &res)
            tmp.removeLast()
        }
    }
}
