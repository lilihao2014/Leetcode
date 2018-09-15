//
//  11. Container With Most Water.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/15.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class MaxArea {
    func maxArea(_ height: [Int]) -> Int {
        guard height.count >= 2 else { return 0 }
        
        var left = 0, right = height.count - 1
        var volume = 0
        while left < right {
            volume = max(volume, (right - left) * min(height[left], height[right]))
            if height[left] < height[right] {
                left += 1
            }else {
                right -= 1
            }
        }
        return volume
    }
}
