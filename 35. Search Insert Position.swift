//
//  35. Search Insert Position.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/11/24.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class SearchInsert {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var left = 0, right = nums.count - 1
        
        while left + 1 < right {
            let mid = left + (right - left) / 2
            if nums[mid] == target {
                return mid
            }
            if nums[mid] >= target {
                right = mid
            }else {
                left = mid + 1
            }
        }
        
        if nums[left] >= target {
            return left
        }else if nums[right] >= target {
            return right
        }else {
            return right + 1
        }
    }
}
