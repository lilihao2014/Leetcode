//
//  41. First Missing Positive.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/26.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class FirstMissingPositive {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        let n = nums.count
        var nums = nums
        for i in 0..<nums.count {
            while(nums[i] > 0 && nums[i] <= n && nums[i] != nums[nums[i] - 1]) {
                nums.swapAt(i, nums[i] - 1)
            }
        }
        for i in 0..<nums.count {
            if nums[i] != i + 1 {
                return i + 1
            }
        }
        return n + 1
    }
}
