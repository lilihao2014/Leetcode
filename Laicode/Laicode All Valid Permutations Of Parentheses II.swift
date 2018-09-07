//
//  Laicode All Valid Permutations Of Parentheses II.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/6.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class ValidParentheses2 {
    
    let list = ["(", ")", "<", ">", "{", "}"]
    
    func validParentheses2(l: Int, m: Int, n: Int) -> [String] {
        let targetLength = l * 2 + m * 2 + n * 2
        var remaining = [l, l, m, m, n, n];
        var stack = [String]()
        var curr = String()
        var res = [String]()
        generateParentheses(curr: &curr, res: &res, remaining: &remaining, stack: &stack, targetLength: targetLength)
        return res
    }
    
    private func generateParentheses(curr: inout String, res: inout [String], remaining: inout [Int], stack: inout [String], targetLength: Int) {
        if curr.count == targetLength {
            res.append(curr)
            return
        }
        
        for i in 0..<remaining.count {
            if i % 2 == 0 {
                if remaining[i] > 0 {
                    curr.append(list[i])
                    remaining[i] -= 1
                    stack.insert(list[i], at: 0)
                    generateParentheses(curr: &curr, res: &res, remaining: &remaining, stack: &stack, targetLength: targetLength)
                    curr.removeLast()
                    remaining[i] += 1
                    stack.removeFirst()
                }
            }else {
                if stack.count > 0 && stack[0] == list[i - 1] {
                    curr.append(list[i])
                    remaining[i] -= 1
                    stack.removeFirst()
                    generateParentheses(curr: &curr, res: &res, remaining: &remaining, stack: &stack, targetLength: targetLength)
                    curr.removeLast()
                    remaining[i] += 1
                    stack.insert(list[i - 1], at: 0)
                }
            }
        }
    }
}
