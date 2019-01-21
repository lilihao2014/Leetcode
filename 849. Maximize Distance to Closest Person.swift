//
//  849. Maximize Distance to Closest Person.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2019/1/20.
//  Copyright © 2019 Lihao Li. All rights reserved.
//

import Foundation

class MaxDistToClosest {
    func maxDistToClosest(_ seats: [Int]) -> Int {
        let n = seats.count
        var prev = -1, future = 0
        var ans = 0
        
        for i in 0..<n {
            if seats[i] == 1 {
                prev = i
            }else {
                while (future < n && seats[future] == 0) || future < i {
                    future += 1
                }
                
                let left = prev == -1 ? n : i - prev
                let right = future == n ? n : future - i
                ans = max(ans, min(left, right))
            }
        }
        
        return ans
    }
}
