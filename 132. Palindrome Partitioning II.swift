//
//  132. Palindrome Partitioning II.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/11/5.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation


class MinCut {
    func minCut(_ s: String) -> Int {
        guard !s.isEmpty else { return 0 }
        
        let sArray = Array(s)
        var cutArray = Array(repeating: Int.max, count: sArray.count)
        var isPalindrome = Array(repeating: Array(repeating: false, count: sArray.count), count: sArray.count)
        for i in 0..<sArray.count {
            for j in 0..<i+1{
                if sArray[i] == sArray[j] && (i - j < 2 || isPalindrome[j + 1][i - 1]) {
                    cutArray[i] = j == 0 ? 0 : min(cutArray[j - 1] + 1, cutArray[i])
                    isPalindrome[j][i] = true
                }
            }
        }
        return cutArray[cutArray.count - 1]
    }
}
