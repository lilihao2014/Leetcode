//
//  403. Frog Jump.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2019/1/7.
//  Copyright © 2019 Lihao Li. All rights reserved.
//

import Foundation

class CanCross {
    func canCross(_ stones: [Int]) -> Bool {
        guard !stones.isEmpty else { return true }
        
        var map = [Int: Set<Int>]()
        map[0] = [0]
        
        for i in 0..<stones.count {
            if let stepsSet = map[stones[i]] {
                for step in stepsSet {
                    var k = step - 1
                    while k <= step + 1 {
                        if k > 0 {
                            if var set = map[stones[i] + k] {
                                set.insert(k)
                                map[stones[i] + k] = set
                            }else {
                                map[stones[i] + k] = [k]
                            }
                        }
                        k += 1
                    }
                }
            }
        }
        
        return !(map[stones[stones.count - 1]]?.isEmpty ?? true)
    }
}
