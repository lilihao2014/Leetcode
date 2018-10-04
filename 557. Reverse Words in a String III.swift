//
//  557. Reverse Words in a String III.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/10/3.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation


class ReverseWordsIII {
    func reverseWords(_ s: String) -> String {
        guard s.count > 0 else { return s }
        
        var left = 0
        var charArray = Array(s)
        for i in 0...charArray.count {
            if i == charArray.count || charArray[i] == " " {
                reverseString(&charArray, left, i - 1)
                left = i + 1
            }
        }
        
        return String(charArray)
    }
    
    private func reverseString(_ charArray: inout [Character], _ i: Int, _ j: Int) {
        var left = i, right = j
        while left < right {
            charArray.swapAt(left, right)
            left += 1
            right -= 1
        }
    }
    
}
