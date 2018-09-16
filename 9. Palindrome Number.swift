//
//  9. Palindrome Number.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/16.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class IsPalindrome {
    func isPalindrome(_ x: Int) -> Bool {
        guard x >= 0 else { return false }
        var x = x
        return x == reverseNumber(&x)
    }
    
    private func reverseNumber(_ x: inout Int) -> Int {
        var res = 0
        while x > 0 {
            res = res * 10 + x % 10
            x /= 10
        }
        return res
    }
}
