//
//  561. Array Partition I.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/11/8.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class ArrayPairSum {
    func arrayPairSum(_ nums: [Int]) -> Int {
        let nums = nums.sorted { $0 < $1 }
        var res = 0
        for i in stride(from: 0, to: nums.count, by: 2) {
            res += nums[i]
        }
        return res
    }
}
