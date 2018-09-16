//
//  42. Trapping Rain Water.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/16.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class Trap {
    func trap(_ height: [Int]) -> Int {
        var left = 0, right = height.count - 1
        var maxLeft = 0, maxRight = 0
        var volume = 0
        while left < right {
            if height[left] > height[right] {
                if height[right] < maxRight {
                    volume += maxRight - height[right]
                }else {
                    maxRight = height[right]
                }
                right -= 1
            }else {
                if height[left] > maxLeft {
                    maxLeft = height[left]
                }else {
                    volume += maxLeft - height[left]
                }
                left += 1
            }
        }
        return volume
    }
}
