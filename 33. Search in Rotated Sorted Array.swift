//
//  33. Search in Rotated Sorted Array.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/21.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class Search {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0, right = nums.count - 1
        while left <= right {
            let mid = left + (right - left) / 2
            if nums[mid] == target { return mid }
            if nums[mid] <= nums[right] {
                if nums[mid] <= target && target <= nums[right] {
                    left = mid + 1
                }else {
                    right = mid - 1
                }
            }else {
                if nums[left] <= target && target <= nums[mid] {
                    right = mid - 1
                }else {
                    left = mid + 1
                }
            }
        }
        return -1
    }

}
