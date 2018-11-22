//
//  125. Valid Palindrome.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/11/22.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class IsPalindromeString {
    func isPalindrome(_ s: String) -> Bool {
        let letterSet = NSCharacterSet.letters
        let numberSet = NSCharacterSet.decimalDigits
        var sArray = [String]()
        
        for c in s.unicodeScalars {
            if letterSet.contains(c) || numberSet.contains(c) {
                sArray.append(String(c).lowercased())
            }
        }
        
        var left = 0, right = sArray.count - 1
        while left < right {
            if sArray[left] != sArray[right] { return false }
            
            left += 1
            right -= 1
        }
        
        return true
    }
}
