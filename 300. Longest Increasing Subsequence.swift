//
//  300. Longest Increasing Subsequence.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/28.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class LengthOfLIS {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        
        var res = Array(repeating: 1, count: nums.count)
        var maxLength = 1
        
        for i in 1..<nums.count {
            var currentLength = 0
            for j in 0..<i {
                if nums[i] > nums[j] {
                    currentLength = max(currentLength, res[j])
                }
                res[i] = currentLength + 1
                maxLength = max(maxLength, res[i])
            }
        }
        
        return maxLength
    }
}
