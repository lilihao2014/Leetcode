//
//  135. Candy.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/10/16.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation


class Candy {
    func candy(_ ratings: [Int]) -> Int {
        guard ratings.count > 0 else { return 0 }
        
        var candyArray = [Int](repeating: 0, count: ratings.count)
        candyArray[0] = 1
        for i in 1..<candyArray.count {
            candyArray[i] = ratings[i] > ratings[i - 1] ? candyArray[i - 1] + 1 : 1
        }
        
        var sum = candyArray[candyArray.count - 1]
        for i in (0..<candyArray.count - 1).reversed() {
            if ratings[i] > ratings[i + 1] {
                candyArray[i] = max(candyArray[i + 1] + 1, candyArray[i])
            }
            sum += candyArray[i]
        }
        return sum
    }
}
