//
//  214. Shortest Palindrome.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/10/24.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation


class ShortestPalindrome {
    func shortestPalindrome(_ s: String) -> String {
        guard !s.isEmpty else { return "" }
        
        var sArray = Array(s)
        var j = 0
        for i in (0..<s.count).reversed() {
            if sArray[i] == sArray[j] {
                j += 1
            }
        }
        if j == sArray.count { return s }
        
        let suffix = String(s[s.index(s.startIndex, offsetBy: j)..<s.index(s.startIndex, offsetBy: s.count)])
        let prefix = suffix.reversed()
        let mid = shortestPalindrome(String(s[s.index(s.startIndex, offsetBy: 0)..<s.index(s.startIndex, offsetBy: j)]))
        return prefix + mid + suffix
    }
}
