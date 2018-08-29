//
//  Laicode Largest SubArray Sum.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/8/28.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class LargestSum {
    func largestSum(array: [Int]) -> Int {
        guard array.count > 0 else {
            return 0
        }
        var res = [Int](repeating: 0, count: array.count)
        var maxSum = array[0]
        res[0] = array[0]
        
        for i in 1..<array.count {
            res[i] = res[i - 1] > 0 ? res[i - 1] + array[i] : array[i]
            maxSum = max(maxSum, res[i])
        }
        
        return maxSum
    }
}
