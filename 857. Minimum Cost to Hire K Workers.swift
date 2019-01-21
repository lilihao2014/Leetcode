//
//  857. Minimum Cost to Hire K Workers.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2019/1/20.
//  Copyright © 2019 Lihao Li. All rights reserved.
//

import Foundation

class MincostToHireWorkers {
    func mincostToHireWorkers(_ quality: [Int], _ wage: [Int], _ K: Int) -> Double {
        var ans = Double.greatestFiniteMagnitude
        
        for i in 0..<quality.count {
            let factor = Double(wage[i]) / Double(quality[i])
            var prices = [Double]()
            var t = 0
            for j in 0..<quality.count {
                let price = Double(quality[j]) * factor
                if price < Double(wage[j]) { continue }
                prices.append(price)
                t += 1
            }
            
            if t < K { continue }
            prices = prices.sorted { $0 < $1 }
            var cand = 0.0
            for i in 0..<K {
                cand += prices[i]
            }
            ans = min(ans, cand)
        }
        return ans
    }
}
