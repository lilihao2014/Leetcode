//
//  16. 3Sum Closest.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/24.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class ThreeSumClosest {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count >= 3 else { return -1 }
        var nums = nums.sorted(){$0 < $1}
        var res = nums[0] + nums[1] + nums[2]
        for i in 0..<nums.count - 2 {
            var j = i + 1, k = nums.count - 1
            while(j < k) {
                let currentSum = nums[i] + nums[j] + nums[k]
                if currentSum == target {
                    return currentSum
                }else {
                    if abs(currentSum - target) < abs(target - res) {
                        res = currentSum
                    }
                    if currentSum < target {
                        j += 1
                    }else {
                        k -= 1
                    }
                }
            }
        }
        return res
    }
}
