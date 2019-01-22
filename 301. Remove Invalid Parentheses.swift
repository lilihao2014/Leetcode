//
//  301. Remove Invalid Parentheses.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2019/1/21.
//  Copyright © 2019 Lihao Li. All rights reserved.
//

import Foundation


class RemoveInvalidParentheses {
    func removeInvalidParentheses(_ s: String) -> [String] {
        var ans = [String]()
        remove(s, &ans, 0, 0, ["(", ")"])
        return ans
    }
    
    
    private func remove(_ s: String, _ ans: inout [String], _ lastI: Int, _ lastJ: Int, _ pair: [Character]) {
        var stack = 0
        
        for i in stride(from: lastI, to: s.count, by: 1) {
            if s[s.index(s.startIndex, offsetBy: i)] == pair[0] {
                stack += 1
            }
            if s[s.index(s.startIndex, offsetBy: i)] == pair[1] {
                stack -= 1
            }
            if stack >= 0 { continue }
            
            for j in lastJ...i {
                if s[s.index(s.startIndex, offsetBy: j)] == pair[1] && (j == lastJ || s[s.index(s.startIndex, offsetBy: j - 1)] != pair[1]) {
                    remove(String(s[..<s.index(s.startIndex, offsetBy: j)] + s[s.index(s.startIndex, offsetBy: j + 1)...]), &ans, i, j, pair)
                }
            }
            
            return
        }
        
        
        let reversed = String(s.reversed())
        if pair[0] == "(" {
            remove(reversed, &ans, 0, 0, [")", "("])
        }else {
            ans.append(reversed)
        }
    }
}
