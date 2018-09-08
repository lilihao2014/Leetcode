//
//  46. Permutations.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/8.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class Permute {
    func permute(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        var numsArray = nums
        generatePermute(index: 0, res: &res, numsArray: &numsArray)
        return res
    }
    
    
    private func generatePermute(index: Int, res: inout [[Int]], numsArray: inout [Int]) {
        if index == numsArray.count {
            res.append(numsArray)
            return
        }
        
        for i in index..<numsArray.count {
            numsArray.swapAt(index, i)
            generatePermute(index: index + 1, res: &res, numsArray: &numsArray)
            numsArray.swapAt(index, i)
        }
    }
}
