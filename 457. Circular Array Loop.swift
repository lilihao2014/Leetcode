//
//  457. Circular Array Loop.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2019/1/20.
//  Copyright © 2019 Lihao Li. All rights reserved.
//

import Foundation

class CircularArrayLoop {
    func circularArrayLoop(_ nums: [Int]) -> Bool {
        var nums = nums
        let n = nums.count
        
        for i in 0..<n {
            if nums[i] == 0 { continue }
            
            var j = i, k = getIndex(i, nums)
            while nums[k] * nums[i] > 0 && nums[getIndex(k, nums)] * nums[i] > 0 {
                if j == k {
                    if j == getIndex(j, nums) {
                        break
                    }
                    return true
                }
                j = getIndex(j, nums)
                k = getIndex(getIndex(k, nums), nums)
            }
            
            j = i
            let val = nums[i]
            while nums[j] * val > 0 {
                let next = getIndex(j, nums)
                nums[j] = 0
                j = next
            }
        }
        
        return false
    }
    
    
    private func getIndex(_ i: Int, _ nums: [Int]) -> Int {
        let n = nums.count
        return i + nums[i] >= 0 ? (i + nums[i]) % n : n + ((i + nums[i]) % n)
    }
}
