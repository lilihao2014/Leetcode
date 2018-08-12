//
//  647. Palindromic Substrings.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/8/12.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class CountSubstrings {
    var count = 0
    
    func countSubstrings(_ s: String) -> Int {
        guard s.count > 0 else {
            return count
        }
        
        let sCharArray = Array(s)
        
        for i in 0..<s.count {
            var left = i, right = i
            checkPalindrome(sCharArray, &left, &right)
            left = i
            right = i + 1
            checkPalindrome(sCharArray, &left, &right)
        }
        return count
    }
    
    private func checkPalindrome(_ sCharArray: [Character], _ left: inout Int, _ right: inout Int) {
        while(left >= 0 && right < sCharArray.count && sCharArray[left] == sCharArray[right]) {
            count += 1
            left -= 1
            right += 1
        }
    }
}
