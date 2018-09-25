//
//  46. Permutations.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/24.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class Permute {
    func permute(_ nums: [Int]) -> [[Int]] {
        var nums = nums
        var res = [[Int]]()
        helper(0, &res, &nums)
        return res
    }
    
    
    private func helper(_ index: Int, _ res: inout [[Int]], _ nums: inout [Int]) {
        if index == nums.count {
            res.append(nums)
            return
        }
        
        for i in index..<nums.count {
            nums.swapAt(i, index)
            helper(index, &res, &nums)
            nums.swapAt(i, index)
        }
    }
}
