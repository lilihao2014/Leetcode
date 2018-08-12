//
//  322. Coin Change.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/8/11.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class CoinChange {
    
    var count = Int.max
    var canChange = false
    
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        var tmp = [Int]()
        coinChangePermutation(amount, &tmp, 0, coins)
        return count
    }
    
    
    func coinChangePermutation(_ amount: Int, _ tmp: inout [Int], _ index: Int, _ coins: [Int]) {
        if index == coins.count - 1 {
            if amount % coins[index] == 0 {
                tmp.append(amount / coins[index])
                var tmpCount = 0
                for j in 0..<tmp.count {
                    tmpCount += tmp[j]
                }
                if canChange == false {
                    count = tmpCount
                }else {
                    count = min(tmpCount, count)
                }
                canChange = true
                tmp.removeLast()
            }else {
                if canChange == false {
                    count = -1
                }
            }
            return
        }
        
        let max = amount / coins[index]
        
        for i in 0...max {
            tmp.append(i)
            coinChangePermutation(amount - coins[index] * i, &tmp, index + 1, coins)
            tmp.removeLast()
        }
    }
}
