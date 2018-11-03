//
//  81. Search in Rotated Sorted Array II.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/10/31.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation


class SearchInRotatedSortedArrayII {
    func search(_ nums: [Int], _ target: Int) -> Bool {
        guard nums.count > 0 else { return false }
        
        var left = 0, right = nums.count - 1
        while left <= right {
            let mid = left + (right - left) / 2
            if nums[mid] == target {
                return true
            }
            
            if nums[left] == nums[mid] && nums[mid] == nums[right] {
                left += 1
                right -= 1
            }else if nums[left] <= nums[mid] {
                if nums[left] <= target && target < nums[mid] {
                    right = mid - 1
                }else {
                    left = mid + 1
                }
            }else {
                if nums[mid] < target && target <= nums[right] {
                    left = mid + 1
                }else {
                    right = mid - 1
                }
            }
        }
        
        return false
    }
}
