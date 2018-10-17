//
//  69. Sqrt(x).swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/10/16.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation


class MySqrt {
    func mySqrt(_ x: Int) -> Int {
        if x == 0 { return 0 }
        var left = 1, right = x
        var res = 1
        while left < right {
            let mid = left + (right - left) / 2
            if mid <= x / mid {
                left = mid + 1
                res = mid
            }else {
                right = mid
            }
        }
        return res
    }
}
