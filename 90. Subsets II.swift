//
//  90. Subsets II.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/9.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class SubsetsWithDup {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        var tmp = [Int]()
        generateSubsets(index: 0, tmp: &tmp, res: &res, nums: nums)
        return res
    }
    
    
    private func generateSubsets(index: Int, tmp: inout [Int], res: inout [[Int]], nums: [Int]) {
        res.append(tmp)
        
        for i in index..<nums.count {
            if i != index && nums[i] == nums[i - 1] {
                continue
            }
            
            tmp.append(nums[i])
            generateSubsets(index: i + 1, tmp: &tmp, res: &res, nums: nums)
            tmp.removeLast()
        }
    }
}
