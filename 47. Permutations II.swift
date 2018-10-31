//
//  47. Permutations II.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/9.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class PermuteUnique {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        var numsArray = nums
        generateUniquePermutations(index: 0, res: &res, nums: &numsArray)
        return res
    }
    
    
    private func generateUniquePermutations(index: Int, res: inout [[Int]], nums: inout [Int]) {
        if index == nums.count {
            res.append(nums)
            return
        }
        
        var usedSet = Set<Int>()
        for i in index..<nums.count {
            if usedSet.contains(nums[i]) {
                continue
            }
            usedSet.insert(nums[i])
            nums.swapAt(index, i)
            generateUniquePermutations(index: index + 1, res: &res, nums: &nums)
            nums.swapAt(index, i)
        }
    }
}
