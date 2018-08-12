//
//  Best Time to Buy and Sell Stock IV.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/8/11.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class MaxProfit4 {
    func maxProfit(_ k: Int, _ prices: [Int]) -> Int {
        var curr = Array(repeating: 0, count: k + 1)
        var res = Array(repeating: 0, count: k + 1)
        for i in 0..<prices.count - 1 {
            let diff = prices[i + 1] - prices[i]
            for j in (1..<k + 1).reversed() {
                curr[j] = max(res[j - 1] + (diff > 0 ? diff : 0), curr[j] + diff)
                res[j] = max(res[j], curr[j])
            }
        }
        return res[k]
    }
}
