//
//  80. Remove Duplicates from Sorted Array II.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/11/5.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class RemoveDuplicates {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        
        var i = 0
        for num in nums {
            if i < 2 || num > nums[i - 2] {
                nums[i] = num
                i += 1
            }
        }
        var res = [Int]()
        for j in 0..<i {
            res.append(nums[j])
        }
        nums = res
        return i
    }
}
