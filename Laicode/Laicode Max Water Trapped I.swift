//
//  Laicode Max Water Trapped I.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/13.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class MaxTrapped {
    func maxTrapped(array: [Int]) -> Int {
        var left = 0, right = array.count - 1
        var maxLeft = -1, maxRight = -1
        var volume = 0
        while left < right {
            if array[left] < array[right] {
                if maxLeft < array[left] {
                    maxLeft = array[left]
                }else {
                    volume += maxLeft - array[left]
                }
                left += 1
            }else {
                if maxRight < array[right] {
                    maxRight = array[right]
                }else {
                    volume += maxRight - array[right]
                }
            }
        }
        return volume
    }
}
