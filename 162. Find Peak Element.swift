//
//  162. Find Peak Element.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/10/9.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation


class FindPeakElement {
    func findPeakElement(_ nums: [Int]) -> Int {
        var left = 0, right = nums.count - 1
        while left < right {
            let mid = left + (right - left) / 2
            if nums[mid] < nums[mid + 1] {
                left = mid + 1
            }else {
                right = mid
            }
        }
        return left
    }
}
