//
//  34. Find First and Last Position of Element in Sorted Array.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/10/16.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation


class SearchRange {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        guard nums.count > 0 else { return [-1, -1] }
        var res = [-1, -1]
        var left = 0, right = nums.count - 1
        while left + 1 < right {
            let mid = left + (right - left) / 2
            if nums[mid] >= target {
                right = mid
            }else {
                left = mid + 1
            }
        }
        if nums[left] == target {
            res[0] = left
        }else if nums[right] == target {
            res[0] = right
        }
        
        left = 0
        right = nums.count - 1
        while left + 1 < right {
            let mid = left + (right - left) / 2
            if nums[mid] <= target {
                left = mid
            }else {
                right = mid - 1
            }
        }
        if nums[right] == target {
            res[1] = right
        }else if nums[left] == target {
            res[1] = left
        }
        
        return res
    }
}
