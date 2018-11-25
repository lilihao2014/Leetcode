//
//  163. Missing Ranges.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/11/24.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class FindMissingRanges {
    func findMissingRanges(_ nums: [Int], _ lower: Int, _ upper: Int) -> [String] {
        var res = [String]()
        if lower > upper {
            return res
        }
        if nums.isEmpty {
            res.append(generateString(lower, upper))
            return res
        }
        
        var prev = lower - 1
        for i in 0..<nums.count + 1 {
            let curr = i == nums.count ? upper + 1 : nums[i]
            if curr - prev > 1 {
                res.append(generateString(prev + 1, curr - 1))
            }
            prev = curr
        }
        return res
    }
    
    private func generateString(_ lower: Int, _ upper: Int) -> String {
        return lower == upper ? "\(lower)" : "\(lower)->\(upper)"
    }
}
