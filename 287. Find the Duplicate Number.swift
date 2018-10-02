//
//  287. Find the Duplicate Number.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/10/1.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class FindDuplicate {
    func findDuplicate(_ nums: [Int]) -> Int {
        var slow = 0, fast = 0
        while true {
            fast = nums[nums[fast]]
            slow = nums[slow]
            if slow == fast { break }
        }
        
        fast = 0
        
        while slow != fast {
            fast = nums[fast]
            slow = nums[slow]
        }
        
        return fast
    }
}
