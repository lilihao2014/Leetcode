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
        if n <= 2 { return 0 }
        var res = 1
        var primesArray = Array(repeating: true, count: n)
        for i in stride(from: 3, to: n, by: 2) {
            if primesArray[i - 1] {
                res += 1
                var j = 3
                while j * i < n {
                    primesArray[j * i - 1] = false
                    j += 2
                }
            }
        }
        return res
    }
}
