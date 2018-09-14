//
//  1. Two Sum.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/13.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class TwoSum {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()
        for i in 0..<nums.count {
            if let previousIndex = dict[target - nums[i]] {
                return [previousIndex, i]
            }else {
                dict[nums[i]] = i
            }
        }
        return [-1, -1]
    }
}
