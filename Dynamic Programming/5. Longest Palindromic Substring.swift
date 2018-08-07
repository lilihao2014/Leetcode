//
//  5. Longest Palindromic Substring.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/8/6.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class LongestPalindrome {
    
    
    //Approach 1: Dynamic Programming, time complexity is O(n^2)
    
    
    func longestPalindrome1(_ s: String) -> String {
        let count = s.count
        guard count > 0 else {
            return String()
        }
        var visited = Array(repeating: Array(repeating: false, count: count), count: count)
        let charArray = Array(s)
        var start = 0, end = 0, max = 0
        for i in 0..<count {
            for j in 0...i {
                if charArray[j] == charArray[i] && (i - j < 2 || visited[j + 1][i - 1] == true) {
                    visited[j][i] = true
                }
                if visited[j][i] == true && max < i - j + 1 {
                    start = j
                    end = i
                    max = i - j + 1
                }
            }
        }
        var res = String()
        for i in start...end {
            res += String(charArray[i])
        }
        return res
    }
    
    
    //Approach 2: Expand Around Center, time complexity is O(n ^ 2), but space complexity is O(1)
    
    
    func longestPalindrome2(_ s: String) -> String {
        var res = String()
        let charArray = Array(s)
        for i in 0..<charArray.count {
            var start = i, end = i
            let res1 = getLongestPalindromeHelper(charArray, &start, &end)
            if res1.count > res.count {
                res = res1
            }
            start = i
            end = i + 1
            let res2 = getLongestPalindromeHelper(charArray, &start, &end)
            if res2.count > res.count {
                res = res2
            }
        }
        return res
    }
    
    
    private func getLongestPalindromeHelper(_ charArray: [Character], _ start: inout Int, _ end: inout Int) -> String {
        while start >= 0 && end < charArray.count && charArray[start] == charArray[end] {
            start -= 1
            end += 1
        }
        start += 1
        var res = String()
        for i in start..<end {
            res += String(charArray[i])
        }
        return res
    }
}
