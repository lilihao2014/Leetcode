//
//  131. Palindrome Partitioning.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/9.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class Partition {
    func partition(_ s: String) -> [[String]] {
        var res = [[String]]()
        var tmp = [String]()
        generatePalindromeList(tmp: &tmp, res: &res, s: s)
        return res
    }
    
    
    private func generatePalindromeList(tmp: inout [String], res: inout [[String]], s: String) {
        if s.count == 0 {
            res.append(tmp)
            return
        }
        
        for i in 0..<s.count {
            let tmpString = String(s[s.index(s.startIndex, offsetBy: 0)..<s.index(s.startIndex, offsetBy: i + 1)])
            if isValidPalindrome(string: tmpString) {
                tmp.append(tmpString)
                generatePalindromeList(tmp: &tmp, res: &res, s: String(s[s.index(s.startIndex, offsetBy: i + 1)...]))
                tmp.removeLast()
            }
            
        }
    }
    
    private func isValidPalindrome(string: String) -> Bool {
        var left = 0, right = string.count - 1
        let tmpArray = Array(string)
        while left < right {
            if tmpArray[left] != tmpArray[right] {
                return false
            }
            left += 1
            right -= 1
        }
        return true
    }
}
