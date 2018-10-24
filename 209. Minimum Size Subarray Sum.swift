//
//  209. Minimum Size Subarray Sum.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/10/23.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation


class MinSubArrayLen {
    func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int { 
        var i = 0, j = 0, sum = 0, minCount = Int.max
        while j < nums.count {
            sum += nums[j]
            while sum >= s {
                minCount = min(minCount, j - i + 1)
                sum -= nums[i]
                i += 1
            }
            j += 1
        }
        return minCount == Int.max ? 0 : minCount
    }
}
