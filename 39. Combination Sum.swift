//
//  39. Combination Sum.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/9.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class CombinationSum {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var res = [[Int]]()
        var tmp = [Int]()
        var candidatesCopy = candidates
        candidatesCopy.sort(){$0 < $1}
        generateCombinations(index: 0, tmp: &tmp, target: target, res: &res, candidates: candidatesCopy)
        return res
    }
    
    
    private func generateCombinations(index: Int, tmp: inout [Int], target: Int, res: inout [[Int]], candidates: [Int]) {
        if target == 0 {
            res.append(tmp)
            return
        }else if target < 0 {
            return
        }
        
        for i in index..<candidates.count {
            if i != index && candidates[i] == candidates[ i - 1] {
                continue
            }
            
            if candidates[i] > target {
                return
            }
            
            tmp.append(candidates[i])
            generateCombinations(index: i, tmp: &tmp, target: target - candidates[i], res: &res, candidates: candidates)
            tmp.removeLast()
        }
    }
}
