//
//  283. Move Zeroes.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/24.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class MoveZeroes {
    func moveZeroes(_ nums: inout [Int]) {
        var left = 0
        for i in 0..<nums.count {
            if nums[i] != 0 {
                if i != left {
                    nums.swapAt(i, left)
                }
                left += 1
            }
        }
    }
}
