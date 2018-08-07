//
//  53. Maximum Subarray.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/8/6.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class MaxSubArray {
    
    
    //Approach 1: Dynamic Programming, time complexity is O(n), space complexity is O(n) too
    
    
    func maxSubArray1(_ nums: [Int]) -> Int {
        let count = nums.count
        guard count > 0 else {
            return -1
        }
        var sumArray = Array(repeating: 0, count: count)
        sumArray[0] = nums[0]
        var maxSum = sumArray[0]
        
        for i in 1..<count {
            sumArray[i] = sumArray[i - 1] > 0 ? sumArray[i - 1] + nums[i] : nums[i]
            maxSum = max(maxSum, sumArray[i])
        }
        return maxSum
    }
    
    
    //Approach 2: Another kind of Dynamic Programming, time complexity is O(1)
    
    
    func maxSubArray2(_ nums: [Int]) -> Int {
        guard nums.count > 0 else {
            return -1
        }
        var sum = nums[0], finalSum = nums[0]
        for i in 1..<nums.count {
            sum = sum > 0 ? sum : 0
            sum += nums[i]
            finalSum = finalSum > sum ? finalSum : sum
        }
        return finalSum
    }
 }
