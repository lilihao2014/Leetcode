//
//  152. Maximum Product Subarray.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/8/9.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

class MaxProduct {
    func maxProduct(_ nums: [Int]) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        var tmpMax = nums[0], tmpMin = nums[0], res = nums[0]
        for index in 1..<nums.count {
            let currNumber = nums[index]
            if currNumber > 0 {
                tmpMax = max(currNumber, tmpMax * currNumber)
                tmpMin = min(currNumber, tmpMin * currNumber)
            }else {
                let tmp = tmpMax
                tmpMax = max(currNumber, tmpMin * currNumber)
                tmpMin = min(currNumber, tmp * currNumber)
            }
            res = max(res, tmpMax)
        }
        return res
    }
}

