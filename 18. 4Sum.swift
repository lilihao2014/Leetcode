//
//  18. 4Sum.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/10/9.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation


class FourSum {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        var res = [[Int]]()
        guard nums.count > 3 else { return res }
        var numsCopy = nums.sorted { $0 < $1 }
        for i in 0..<numsCopy.count - 3 {
            if i != 0 && numsCopy[i] == numsCopy[i - 1] {
                continue
            }
            for j in i + 1..<numsCopy.count - 2 {
                if j != i + 1 && numsCopy[j] == numsCopy[j - 1] {
                    continue
                }
                var m = j + 1, n = numsCopy.count - 1
                while m < n {
                    let sum = numsCopy[i] + numsCopy[j] + numsCopy[m] + numsCopy[n]
                    if sum == target {
                        let tmp = [numsCopy[i], numsCopy[j], numsCopy[m], numsCopy[n]]
                        res.append(tmp)
                        m += 1
                        n -= 1
                        while m < n && numsCopy[m] == numsCopy[m - 1] {
                            m += 1
                        }
                        while m < n && numsCopy[n] == numsCopy[n + 1] {
                            n -= 1
                        }
                    }else if sum < target {
                        m += 1
                    }else {
                        n -= 1
                    }
                }
            }
        }
        return res
    }
}
