//
//  416. Partition Equal Subset Sum.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/8/12.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class CanPartition {
    func canPartition(_ nums: [Int]) -> Bool {
        guard nums.count > 1 else {
            return false
        }
        var sum = 0
        for i in 0..<nums.count {
            sum += nums[i]
        }
        if sum % 2 != 0 {
            return false
        }
        sum /= 2
        var sumArray = [Bool](repeating: false, count: sum + 1)
        sumArray[0] = true
        for i in 0..<nums.count {
            let curr = nums[i]
            for j in (curr..<sumArray.count).reversed() {
                sumArray[j] = sumArray[j] || sumArray[j - curr]
            }
        }
        return sumArray[sumArray.count - 1]
    }
}
