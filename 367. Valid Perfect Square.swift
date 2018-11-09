//
//  367. Valid Perfect Square.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/11/8.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class IsPerfectSquare {
    func isPerfectSquare(_ num: Int) -> Bool {
        var left = 1, right = num
        while left <= right {
            let mid = left + (right - left) / 2
            if mid > num / mid {
                right = mid - 1
            }else if mid < num / mid {
                left = mid + 1
            }else {
                return num % mid == 0
            }
        }
        return false
    }
}
