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
        guard nums.count > 0 else { return [Int]() }
        var res = Array(repeating: 0, count: nums.count - k + 1)
        var queue = [Int]()
        var currentIndex = 0
        for i in 0..<nums.count {
            while let first = queue.first, first < i - k + 1 {
                queue.removeFirst()
            }
            while let last = queue.last, nums[last] < nums[i] {
                queue.removeLast()
            }
            queue.append(i)
            if i >= k - 1 {
                if let first = queue.first {
                    res[currentIndex] = nums[first]
                    currentIndex += 1
                }
            }
        }
        return res
    }
}
