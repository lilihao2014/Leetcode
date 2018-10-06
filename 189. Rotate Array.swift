//
//  189. Rotate Array.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/10/5.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation


class Rotate {
    func rotate(_ nums: inout [Int], _ k: Int) {
        var left = 0, right = nums.count - 1
        while left < right {
            nums.swapAt(left, right)
            left += 1
            right -= 1
        }
        
        let pivotal = k % nums.count
        
        left = 0
        right = pivotal - 1
        while left < right {
            nums.swapAt(left, right)
            left += 1
            right -= 1
        }
        
        left = pivotal
        right = nums.count - 1
        while left < right {
            nums.swapAt(left, right)
            left += 1
            right -= 1
        }
        
    }
}
