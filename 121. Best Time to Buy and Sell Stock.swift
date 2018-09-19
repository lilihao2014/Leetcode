//
//  121. Best Time to Buy and Sell Stock.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/18.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class MaxProfit {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 1 else {return 0}
        var minPrice = prices[0], maxProfit = 0
        for i in 1..<prices.count {
            minPrice = min(minPrice, prices[i])
            maxProfit = max(maxProfit, prices[i] - minPrice)
        }
        return maxProfit
    }
}
