//
//  228. Summary Ranges.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/10/16.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation


class SummaryRanges {
    func summaryRanges(_ nums: [Int]) -> [String] {
        var res = [String]()
        guard nums.count > 0 else { return res }
        
        var start = 0, runner = 0
        let len = nums.count
        while runner < len {
            if runner == len - 1 || nums[runner] + 1 != nums[runner + 1] {
                if runner == start {
                    res.append("\(nums[start])")
                }else {
                    res.append("\(nums[start])->\(nums[runner])")
                }
                start = runner + 1
            }
            runner += 1
        }
        return res
    }
}
