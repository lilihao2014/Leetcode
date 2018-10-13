//
//  268. Missing Number.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/10/12.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation


class MissingNumber {
    func missingNumber(_ nums: [Int]) -> Int {
        let expectedSum = (1 + nums.count) * nums.count / 2
        var currSum = 0
        for num in nums {
            currSum += num
        }
        return expectedSum - currSum
    }
}
