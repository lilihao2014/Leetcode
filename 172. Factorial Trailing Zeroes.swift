//
//  172. Factorial Trailing Zeroes.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/11/5.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class TrailingZeroes {
    func trailingZeroes(_ n: Int) -> Int {
        var count = 0
        var n = n
        while n > 0 {
            count += n / 5
            n /= 5
        }
        return count
    }
}
