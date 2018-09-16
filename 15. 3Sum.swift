//
//  15. 3Sum.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/16.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class ThreeSum {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var nums = nums
        guard nums.count > 2 else { return [[Int]]()}
        
        var res = [[Int]]()
        nums.sort(){$0 < $1}
        for i in 0..<nums.count - 2 {
            if i != 0 && nums[i] == nums[i - 1] {
                continue
            }
            var j = i + 1, k = nums.count - 1
            while(j < k) {
                let sum = nums[i] + nums[j] + nums[k]
                if sum == 0 {
                    let tmp = [nums[i], nums[j], nums[k]]
                    res.append(tmp)
                    j += 1
                    k -= 1
                    while j < k && nums[j] == nums[j - 1] {
                        j += 1
                    }
                    while j < k && nums[k] == nums[k + 1] {
                        k -= 1
                    }
                }else if sum < 0 {
                    j += 1
                }else {
                    k -= 1
                }
            }
        }
        return res
    }
}
