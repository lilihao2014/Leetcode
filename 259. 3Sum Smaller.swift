//
//  259. 3Sum Smaller.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/11/8.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class ThreeSumSmaller {
    func threeSumSmaller(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count > 2 else { return 0 }
        let nums = nums.sorted { $0 < $1 }
        var res = 0
        for i in 0..<nums.count - 2 {
            var j = i + 1, k = nums.count - 1
            while j < k {
                let sum = nums[i] + nums[j] + nums[k]
                if sum < target {
                    res += k - j
                    j += 1
                }else {
                    k -= 1
                }
            }
        }
        return res
    }
}
