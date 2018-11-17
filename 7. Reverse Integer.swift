//
//  7. Reverse Integer.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/16.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class Reverse {
    func reverse(_ x: Int) -> Int {
        var res = 0
        var x = x
        while x != 0 {
            if res < Int32.min / 10 || res > Int32.max / 10 { return 0 }
            res = res * 10 + x % 10
            x /= 10
        }
        return res
    }
}
