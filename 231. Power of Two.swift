//
//  231. Power of Two.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/11/8.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class IsPowerOfTwo {
    func isPowerOfTwo(_ n: Int) -> Bool {
        if n < 1 {
            return false
        }else if n == 1 {
            return true
        }else {
            var n = n
            while n > 1 && n % 2 == 0{
                n /= 2
            }
            return n == 1
        }
    }
}
