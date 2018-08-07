//
//  198. House Robber.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/8/6.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation



class Rob {
    func rob(_ nums: [Int]) -> Int {
        var prev = 0, currMax = 0
        for i in 0..<nums.count {
            let tmp = currMax
            currMax = max(currMax, prev + nums[i])
            prev = tmp
        }
        return currMax
    }
}
