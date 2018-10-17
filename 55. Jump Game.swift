//
//  55. Jump Game.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/10/16.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation


class CanJump {
    func canJump(_ nums: [Int]) -> Bool {
        guard nums.count > 0 else { return true }
        
        var farest = nums[0]
        for i in 1..<nums.count {
            if i <= farest && nums[i] + i > farest {
                farest = nums[i] + i
            }
        }
        return farest >= nums.count - 1
    }
}
