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
        
        swapNums(&nums, &left, &right)
        
        let k = k % nums.count
        left = 0
        right = k - 1
        swapNums(&nums, &left, &right)
        
        left = k
        right = nums.count - 1
        swapNums(&nums, &left, &right)
    }
    
    
    private func swapNums(_ nums: inout [Int], _ left: inout Int, _ right: inout Int) {
        while left < right {
            nums.swapAt(left, right)
            left += 1
            right -= 1
        }
    }
}
