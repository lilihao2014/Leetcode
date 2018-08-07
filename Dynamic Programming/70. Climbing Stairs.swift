//
//  70. Climbing Stairs.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/8/6.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation


class ClimbStairs {
    
    
    //Approach 1: Dynamic Programming, time complexity is O(n), space complexity is O(n) too
    
    
    func climbStairs1(_ n: Int) -> Int {
        if n == 0 {
            return 0
        }else if n == 1 {
            return 1
        }else {
            var resArray = Array(repeating: 0, count: n + 1)
            resArray[0] = 1
            resArray[1] = 1
            for i in 2...n {
                resArray[i] = resArray[i - 1] + resArray[i - 2]
            }
            return resArray[n]
        }
    }
    
    
    //Approach 2: Fibonacci Number, time complexity is O(n), space complexity is O(1)
    
    
    func climbStairs2(_ n: Int) -> Int {
        if n == 0 {
            return 0
        }else if n == 1 {
            return 1
        }else {
            var prev1 = 1, prev2 = 1
            var res = 0
            for _ in 2...n {
                res = prev1 + prev2
                prev2 = prev1
                prev1 = res
            }
            return res
        }
    }
}
