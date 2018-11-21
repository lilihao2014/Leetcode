//
//  204. Count Primes.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/30.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation


class CountPrimes {
    func countPrimes(_ n: Int) -> Int {
        if n <= 2 {
            return 0
        }
        
        var isPrimeArray = [Bool](repeating: true, count: n)
        var maxCount = 0
        for i in 2..<n {
            if isPrimeArray[i] {
                maxCount += 1
                var j = 2
                while j * i < n {
                    isPrimeArray[i * j] = false
                    j += 1
                }
            }
        }
        return maxCount
    }
}
