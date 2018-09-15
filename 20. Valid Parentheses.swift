//
//  20. Valid Parentheses.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/15.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class Solution {
    func isValid(_ s: String) -> Bool {
        var stack = [Character]()
        for character in s {
            if character == "{" || character == "(" || character == "[" {
                stack.append(character)
            } else if !stack.isEmpty && ((character == ")" && stack.last == "(") || (character == "]" && stack.last == "[") || (character == "}" && stack.last == "{")) {
                stack.removeLast()
            }else {
                return false
            }
        }
        return stack.isEmpty
    }
}
