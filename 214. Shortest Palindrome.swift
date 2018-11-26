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
        let sArray = Array(s)
        var j = 0
        for i in (0..<s.count).reversed() {
            if sArray[i] == sArray[j] {
                j += 1
            }
        }
        if j == s.count { return s }
        let suffix = String(sArray[j...])
        let prefix = suffix.reversed()
        let mid = shortestPalindrome(String(sArray[0..<j]))
        
        return prefix + mid + suffix
    }
}
