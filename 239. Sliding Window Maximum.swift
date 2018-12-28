//
//  239. Sliding Window Maximum.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/28.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class MaxSlidingWindow {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        guard !nums.isEmpty, nums.count >= k else { return [Int]() }
        
        var res = [Int]()
        var queue = [Int]()
        
        for i in 0..<nums.count {
            while !queue.isEmpty && queue.first! <= i - k {
                queue.removeFirst()
            }
            
            while !queue.isEmpty && nums[queue.last!] < nums[i] {
                queue.removeLast()
            }
            
            queue.append(i)
            
            if i >= k - 1 {
                if let firstIndex = queue.first {
                    res.append(nums[firstIndex])
                }
            }
        }
        
        return res
    }
}
