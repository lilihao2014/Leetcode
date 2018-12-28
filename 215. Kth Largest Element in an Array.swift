//
//  215. Kth Largest Element in an Array.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/26.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class FindKthLargest {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        guard nums.count >= k else { return -1 }
        
        var nums = nums
        return helper(&nums, 0, nums.count - 1, k)
    }
    
    
    private func helper(_ nums: inout [Int], _ left: Int, _ right: Int, _ k: Int) -> Int {
        let pivot = partition(&nums, left, right)
        
        if pivot - left == k - 1 {
            return nums[pivot]
        }
        
        if pivot - left > k - 1 {
            return helper(&nums, left, pivot - 1, k)
        }else {
            return helper(&nums, pivot + 1, right, k - (pivot + 1 - left))
        }
    }
    
    
    private func partition(_ nums: inout [Int], _ left: Int, _ right: Int) -> Int {
        var x = nums[right], i = left
        for j in left..<right {
            if nums[j] >= x {
                nums.swapAt(i, j)
                i += 1
            }
        }
        nums.swapAt(i, right)
        return i
    }
}
