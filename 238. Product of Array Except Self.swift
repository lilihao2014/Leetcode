//
//  238. Product of Array Except Self.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/18.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class ProductExceptSelf {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var res = Array(repeating: 1, count: nums.count)
        for i in 1..<res.count {
            res[i] = res[i - 1] * nums[i - 1]
        }
        var num = nums[nums.count - 1]
        for i in (0..<nums.count - 1).reversed() {
            res[i] *= num
            num *= nums[i]
        }
        return res
    }
}
