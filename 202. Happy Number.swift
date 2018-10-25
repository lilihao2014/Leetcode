//
//  202. Happy Number.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/10/24.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation


class IsHappy {
    func isHappy(_ n: Int) -> Bool {
        guard n != 0 else { return false }
        
        var x = n, y = n
        while x > 0 {
            x = cal(x)
            if x == 1 { return true }
            y = cal(cal(y))
            if y == 1 { return true }
            if x == y { return false }
        }
        return false
    }
    
    
    private func cal(_ n: Int) -> Int {
        var res = 0
        var n = n
        while n > 0 {
            res += (n % 10) * (n % 10)
            n /= 10
        }
        return res
    }
}
