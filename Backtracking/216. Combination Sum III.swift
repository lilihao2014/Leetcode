//
//  216. Combination Sum III.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/9.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class CombinationSum3 {
    func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
        var res = [[Int]]()
        var tmp = [Int]()
        generateCombinations(count: k, index: 1, tmp: &tmp, res: &res, target: n)
        return res
    }
    
    
    private func generateCombinations(count: Int, index: Int, tmp: inout [Int], res: inout [[Int]], target: Int) {
        if target == 0 && count == tmp.count {
            res.append(tmp)
            return
        }else if count == tmp.count && target != 0 {
            return
        }else {
            for i in index..<10 {
                tmp.append(i)
                generateCombinations(count: count, index: i + 1, tmp: &tmp, res: &res, target: target - i)
                tmp.removeLast()
            }
        }
    }
}
