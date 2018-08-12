//
//  123. Best Time to Buy and Sell Stock III.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/8/9.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

class MaxProfit3 {
    func maxProfit(_ prices: [Int]) -> Int {
        var res = Array(repeating: 0, count: 3)
        var curr = Array(repeating: 0, count: 3)
        for i in 0..<prices.count - 1 {
            let diff = prices[i + 1] - prices[i]
            for j in (1...2).reversed() {
                curr[j] = max(res[j - 1] + (diff > 0 ? diff : 0), curr[j] + diff)
                res[j] = max(res[j], curr[j])
            }
        }
        return res[2]
    }
}
